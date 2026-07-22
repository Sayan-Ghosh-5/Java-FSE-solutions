import "./App.css";
import BookDetails, { books } from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

function App() {

    return (

        <div className="container">

            <CourseDetails />

            <BookDetails books={books} />

            <BlogDetails />

        </div>

    );
}

export default App;
