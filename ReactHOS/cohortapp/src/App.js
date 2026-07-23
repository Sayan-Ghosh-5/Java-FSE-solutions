import CohortDetails from "./Components/CohortDetails";

function App() {

    return (
        <div>

            <h1>Cohorts Details</h1>

            <CohortDetails
                name="INTADMDF10 -.NET FSD"
                startedOn="22-Feb-2022"
                status="Completed"
                coach="Aathma"
                trainer="Jojo Jose"
            />

            <CohortDetails
                name="ADM21JF014 - Java FSD"
                startedOn="10-Sep-2021"
                status="Ongoing"
                coach="Apoorv"
                trainer="Elisa Smith"
            />

            <CohortDetails
                name="CDBJF21025 - Java FSD"
                startedOn="24-Dec-2021"
                status="Ongoing"
                coach="Aathma"
                trainer="John Doe"
            />

        </div>
    );
}

export default App;
