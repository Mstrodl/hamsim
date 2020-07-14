import {HAMUEL_IMAGE} from "../Settings.js";
import React from "react";

export const characterImages = {
  hammy: require("url:../characters/hammy.png"),
  hamuel_all: require("url:../characters/hamuel_all.png"),
};
export const scenes = {
  rally_selfie: require("url:../assets/hammy-ushanka.png"),
  // I wish I could put quotation marks in filenames
  mac_and_cheese: require("url:../assets/mac_and_cheese.png"),
  crockpot: require("url:../assets/crockpot.png"),
};

export function CharacterText({children, msg, character}) {
  return (
    <div className="character-text-wrap super-text-wrap">
      {msg && msg.tags.Image && (
        <img
          className="character-image message-image"
          src={scenes[msg.tags.Image]}
        />
      )}
      <div className="character-text text-message">
        <div className="text-wrap">
          <img
            className="avatar"
            src={characterImages[character.toLowerCase()]}
          />
          <div className="content">{children}</div>
        </div>
      </div>
    </div>
  );
}

export function PlayerText({children, msg}) {
  return (
    <div className="player-text-wrap super-text-wrap">
      {msg.tags.Image && (
        <img
          className="player-image message-image"
          src={scenes[msg.tags.Image]}
        />
      )}

      <div className="player-text text-message">
        <div className="text-wrap">
          <div className="content">{children}</div>
          <img
            className="avatar"
            src={characterImages["hamuel_" + HAMUEL_IMAGE]}
          />
        </div>
      </div>
    </div>
  );
}
