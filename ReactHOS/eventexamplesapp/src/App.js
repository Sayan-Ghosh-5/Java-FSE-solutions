import { useState } from "react";
import CurrencyConverter from "./CurrencyConverter";

function App() {

    const [count, setCount] = useState(5);

    const increment = () => {

        setCount(count + 1);

        sayHello();
    };

    const decrement = () => {

        setCount(count - 1);
    };

    const sayHello = () => {

        alert("Hello! Member1");
    };

    const sayWelcome = (message) => {

        alert(message);
    };

    const onPress = () => {

        alert("I was clicked");
    };

    return (

        <div>

            <h2>{count}</h2>

            <button onClick={increment}>
                Increment
            </button>

            <br />
            <br />

            <button onClick={decrement}>
                Decrement
            </button>

            <br />
            <br />

            <button
                onClick={() =>
                    sayWelcome("welcome")
                }
            >
                Say welcome
            </button>

            <br />
            <br />

            <button onClick={onPress}>
                Click on me
            </button>

            <br />
            <br />

            <CurrencyConverter />

        </div>
    );
}

export default App;
