import React from "react";

function ListofIndianPlayers({ IndianPlayers }) {

    return (
        <div>
            <ul>
                {IndianPlayers.map((player, index) => (
                    <li key={index}>
                        Mr. {player}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default ListofIndianPlayers;
