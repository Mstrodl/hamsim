import React, {useContext} from "react";
import {NoteStatus} from "../Context";

export function NoteText({children}) {
  return <div className="note-message">{children}</div>;
}

export function JournalEntry({children, msg}) {
  const setNote = useContext(NoteStatus);

  return (
    <div className="note-message">
      Journal Entry Added:{" "}
      <a
        href="#"
        onClick={(ev) => {
          event.preventDefault();
          setNote(msg.tags.JournalEntry);
        }}
      >
        {msg.content}
      </a>
    </div>
  );
}

export function Kinetic({children, msg}) {
  return (
    <div className="note-message kinetic">
      {children.split("").map((child, index) => (
        <span key={index} className="child">
          {child}
        </span>
      ))}
    </div>
  );
}
