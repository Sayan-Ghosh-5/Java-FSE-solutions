import "./App.css";
import office from "./office.jpg";

function App() {

    const heading = "Office Space , at Affordable Range";

    const officeDetails = [
        {
            Name: "DBS",
            Rent: 50000,
            Address: "Chennai"
        },
        {
            Name: "Regus",
            Rent: 75000,
            Address: "Bangalore"
        },
        {
            Name: "WeWork",
            Rent: 55000,
            Address: "Hyderabad"
        }
    ];

    return (

        <div className="container">

            <h1>{heading}</h1>

            {officeDetails.map((officeItem, index) => (

                <div key={index} className="officeCard">

                    <img
                        src={office}
                        alt="Office Space"
                        width="250"
                        height="200"
                    />

                    <h2>Name: {officeItem.Name}</h2>

                    <h3
                        className={
                            officeItem.Rent <= 60000
                                ? "textRed"
                                : "textGreen"
                        }
                    >
                        Rent: Rs. {officeItem.Rent}
                    </h3>

                    <h3>
                        Address: {officeItem.Address}
                    </h3>

                </div>

            ))}

        </div>
    );
}

export default App;
