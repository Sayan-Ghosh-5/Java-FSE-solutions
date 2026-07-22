import React from "react";

function CourseDetails() {

    const courses = [

        {
            id: 1,
            cname: "Angular",
            date: "4/5/2021"
        },

        {
            id: 2,
            cname: "React",
            date: "6/3/2021"
        }

    ];

    return (

        <div className="box">

            <h1>Course Details</h1>

            {courses.map((course) => (

                <div key={course.id}>

                    <h2>{course.cname}</h2>

                    <h4>{course.date}</h4>

                </div>

            ))}

        </div>

    );
}

export default CourseDetails;
