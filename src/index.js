import {render} from "react-dom";
import React from "react";
import {App} from "./components/App.jsx";

console.log("Rend");
render(React.createElement(App), document.getElementById("mount"));
