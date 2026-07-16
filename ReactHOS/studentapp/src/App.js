import logo from "./logo.svg";
import "./App.css";
import Home from "./components/Home";
import About from "./components/About";
import Contacts from "./components/Contacts";

function App() {
  return (
    <div className="Container">
      
        <Home />
        <About />
        <Contacts />
      
    </div>
  );
}

export default App;
