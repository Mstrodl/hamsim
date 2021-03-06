import {CharacterText, PlayerText} from "./TextMessage.jsx";
import {NoteText, JournalEntry, Kinetic} from "./NoteMessage.jsx";
import React from "react";
import {TypingIndicator} from "./TypingIndicator.jsx";

const Types = {
  Character: CharacterText,
  Player: PlayerText,
  Note: NoteText,
  JournalEntry,
  Kinetic,
};

export function Messages({character, chat, typing, setEnded}) {
  const results = chat.map((msg, index) => {
    const Element = Types[msg.type];
    return (
      <Element key={index} msg={msg} character={character} setEnded={setEnded}>
        {msg.content}
      </Element>
    );
  });
  if (typing) {
    console.log(typing);
    results.push(
      <CharacterText msg={null} character={character} key="typing">
        <TypingIndicator />
      </CharacterText>
    );
  }
  return results;
}
