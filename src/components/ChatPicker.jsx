import React from "react";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faChevronRight} from "@fortawesome/free-solid-svg-icons";
import {characterImages} from "./TextMessage.jsx";

export function ChatPicker({onChange}) {
  const items = ["Hammy"];

  return (
    <div className="chat-picker">
      <div className="chat-top">Messages</div>
      <div className="chats">
        {items.map((item) => (
          <div
            key={item}
            className="chat-button"
            onClick={() => onChange(item)}
          >
            <span className="chat-avatar">
              <img src={characterImages[item.toLowerCase()]} />
            </span>
            <span className="chat-name">{item}</span>
            <span className="right-decoration">
              <FontAwesomeIcon icon={faChevronRight} />
            </span>
          </div>
        ))}
      </div>
    </div>
  );
}
