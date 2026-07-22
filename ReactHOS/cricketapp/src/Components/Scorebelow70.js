import React from "react";

function Scorebelow70({ players }) {

    const players70 = [];

    players.map((item) => {
        if (item.score <= 70) {
            players70.push(item);
        }
        return null;
    });

    return (
        <div>
            <ul>
                {players70.map((item, index) => (
                    <li key={index}>
                        Mr. {item.name} {item.score}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default Scorebelow70;
