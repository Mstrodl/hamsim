import React from "react";

export function InputChip({children, onClick}) {
  return (
    <div onClick={onClick} className="input-chip">
      {children}
    </div>
  );
}
