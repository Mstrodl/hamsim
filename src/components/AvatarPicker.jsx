import {avatars} from "./TextMessage.jsx";
import React from "react";

export function AvatarPicker({setAvatar}) {
  return (
    <div className="avatar-picker">
      <h2>Select a risque avatar</h2>
      <div className="avatar-list">
        {Object.entries(avatars).map(([avatar, url]) => (
          <img
            key={avatar}
            onClick={(event) => {
              event.preventDefault();
              setAvatar(avatar);
            }}
            src={url}
            className="avatar-icon"
          />
        ))}
      </div>
    </div>
  );
}
