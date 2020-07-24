import React, {useRef, useState, useEffect} from "react";
import {ChatPicker} from "./ChatPicker.jsx";
import {Messages} from "./Messages.jsx";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faChevronLeft} from "@fortawesome/free-solid-svg-icons";
import {Avatar} from "../Context";
import {AvatarPicker} from "./AvatarPicker";
import {CreditsScroller} from "./CreditsScroller";

import {Story} from "inkjs";
import {InputChip} from "./InputChip.jsx";

import hammyStory from "../stories/hammy.json";

const stories = new Map();
const storyFiles = {
  hammy: hammyStory,
};

function sleep(duration) {
  return new Promise((res) => setTimeout(res, duration));
}

async function generateChat(story, character, realSetChat, setTyping) {
  function setChat(value) {
    if (typeof value == "function") {
      realSetChat((current) => {
        const chat = value(current);
        stories.get(character).chat = chat;
        return chat;
      });
    } else {
      realSetChat(value);
      stories.get(character).chat = value;
    }
  }
  console.warn("generateChat");
  while (story.canContinue) {
    console.log(story);
    const paragraph = story.Continue().replace(/^"(.+)"$/m, "$1");
    const tags = story.currentTags;

    const tagsObject = {};
    /* {
     *   Character: true,
     *   JournalEntry: "after_rally"
     * }; */

    for (const tag of tags) {
      const sepIndex = tag.indexOf(":");
      if (sepIndex == -1) {
        tagsObject[tag] = true;
      } else {
        const key = tag.substring(0, sepIndex);
        const value = tag.substring(sepIndex + 1);
        tagsObject[key] = value;
      }
    }

    const message = {
      content: paragraph,
      tags: tagsObject,
      type:
        ["Character", "Kinetic", "Note", "JournalEntry"].find((tag) =>
          tagsObject.hasOwnProperty(tag)
        ) || "Player",
    };
    console.log(message);

    if (message.tags.Note || message.tags.Kinetic) {
      message.content = "";
      let messageIndex = null;
      setChat((chat) => {
        messageIndex = chat.length;
        return [...chat, message];
      });
      for (let index in paragraph) {
        message.content += paragraph[index];
        await sleep(50);
        setChat((chat) => {
          chat[messageIndex] = Object.assign({}, message);
          return Array.from(chat);
        });
      }
      continue;
    }
    await sleep(200);

    if (message.tags.Character) {
      setTyping(true);
      await sleep((message.content.split(" ").length / 27) * 5 * 1000);
      setTyping(false);
    }

    // Can't mutate because pure function.. lol
    setChat((chat) => [...chat, message]);
  }
}

export function App() {
  const [character, setCharacter] = useState(null);
  const [chat, setChat] = useState([]);
  const [typing, setTyping] = useState(false);
  const [story, setStory] = useState(null);
  const [locked, setLocked] = useState(false);

  useEffect(() => {
    if (character === null) return;
    const oldStory = stories.get(character);
    if (!oldStory) {
      const story = new Story(storyFiles[character.toLowerCase()]);
      const chat = [];
      stories.set(character, {
        story,
        chat,
      });
      setStory(story);
      setChat(chat);

      setLocked(true);
      generateChat(story, character, setChat, setTyping).then(() =>
        setLocked(false)
      );
    } else {
      setStory(oldStory.story);
      setChat(oldStory.chat);
    }
  }, [character]);

  const messageRef = useRef(null);
  useEffect(() => {
    if (messageRef.current) {
      messageRef.current.scrollTop = messageRef.current.scrollHeight;
    }
  });

  const [avatar, setAvatar] = useState(null);

  const isEnded = story && !story.canContinue && !story.currentChoices.length;
  const [ended, setEnded] = useState(false);

  if (ended) {
    return (
      <CreditsScroller
        reset={() => {
          stories.clear();
          setCharacter(null);
          setEnded(false);
        }}
      />
    );
  }

  if (avatar == null) {
    return <AvatarPicker setAvatar={setAvatar} />;
  } else if (character === null || story === null) {
    return (
      <ChatPicker
        onChange={(character) => {
          setCharacter(character);
        }}
      />
    );
  } else {
    return (
      <div className="chat">
        <div className="bar">
          <div
            className="back"
            onClick={(event) => {
              event.preventDefault();
              setCharacter(null);
            }}
          >
            <FontAwesomeIcon icon={faChevronLeft} />
          </div>
          <div className="name">{character}</div>
        </div>
        <div className="messages" ref={messageRef}>
          <Avatar.Provider value={{setAvatar, avatar}}>
            <Messages
              setEnded={setEnded}
              typing={typing}
              chat={chat}
              character={character}
            />
          </Avatar.Provider>
        </div>
        <div
          className={
            "input-chips " +
            (story.currentChoices.length && !locked ? "has-children" : "")
          }
        >
          {!locked &&
            story.currentChoices.map((choice) => (
              <InputChip
                onClick={(event) => {
                  event.preventDefault();
                  story.ChooseChoiceIndex(choice.index);
                  setLocked(true);
                  generateChat(story, character, setChat, setTyping).then(() =>
                    setLocked(false)
                  );
                }}
                key={choice.index}
              >
                {choice.text.replace(/^"(.+)"$/m, "$1")}
              </InputChip>
            ))}
        </div>
      </div>
    );
  }
}
