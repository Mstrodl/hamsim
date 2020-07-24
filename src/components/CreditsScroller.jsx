import React, {useState, useEffect} from "react";

export const credits = [
  {
    title: "Developer",
    name: "Mary Strodl",
  },
  {
    title: "Storyboarding",
    name: 'Kevin "Blevin" Stegemann',
  },
  {
    title: "Story",
    name: "Colin Mihill",
  },
  {
    title: "Story",
    name: "Tyler Davis",
  },
  {
    title: "Story",
    name: "Owen Vanhoose",
  },
];

export function CreditsScroller({reset}) {
  const [credit, setCredit] = useState(0);
  const [done, setDone] = useState(false);

  useEffect(() => {
    const interval = setInterval(() => {
      setCredit((credit) => {
        const newCredit = credit + 1;
        if (newCredit >> 1 == credits.length) {
          clearInterval(interval);
          setDone(true);
        }
        return newCredit;
      });
    }, 2000);

    return () => {
      clearInterval(interval);
    };
  }, []);

  return (
    <div className="credits">
      {!done ? (
        <div
          className="credits-jumbotron"
          style={{opacity: credit & 1 ? "0" : "1"}}
        >
          <h2>{credits[credit >> 1].title}</h2>
          <hr />
          <h1>{credits[credit >> 1].name}</h1>
        </div>
      ) : (
        <div className="credits-jumbotron">
          <h1>Thank you for playing!</h1>
          <hr />
          <h2>Remember you can play again to discover other endings!</h2>
          <div
            onClick={(event) => {
              event.preventDefault();
              reset();
            }}
            className="restart-button"
          >
            RESTART
          </div>
        </div>
      )}
    </div>
  );
}
