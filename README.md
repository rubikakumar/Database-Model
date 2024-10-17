# Database-Model

This project is an educational management system designed to streamline the process of managing students, instructors, courses, lessons, and various administrative tasks in an educational institution. The system allows for efficient tracking of student enrollments, attendance, assignments, and feedback while providing a structured approach to managing courses and instructors.

### Features

- **Student Management**: Add, update, and manage student details, including contact information, enrollment dates, and status.
- **Instructor Management**: Maintain a record of instructors with their contact details and course assignments.
- **Course Management**: Create and manage courses, lessons, and assignments linked to specific instructors.
- **Enrollment Tracking**: Enroll students in batches and monitor their enrollment status.
- **Feedback System**: Collect and store feedback from students regarding courses and instructors.
- **Attendance Tracking**: Record attendance for lessons, noting the status of each student.
- **Certificate Issuance**: Manage the issuance of certificates to students upon course completion.
- **Leaderboard**: Track and display student rankings based on their performance in batches.

### Technologies Used

- **Database**: MySQL

### Database Schema

The database schema includes the following tables:

- **Students**: Stores student information such as name, email, and status.
- **Instructors**: Contains details about instructors, including contact information.
- **Courses**: Manages course details and links to instructors.
- **Lessons**: Holds lesson content related to courses.
- **Assignments**: Tracks assignments given in courses.
- **Submissions**: Records student submissions for assignments.
- **Batches**: Manages batches of students for specific courses.
- **Enrollments**: Tracks student enrollments in batches.
- **Feedback**: Collects feedback from students regarding courses and instructors.
- **Attendance**: Records student attendance for lessons.
- **Certificates**: Manages certificates issued to students.
- **Leaderboard**: Displays rankings of students based on their performance.

For a detailed view of the database structure, refer to the DB Model.png image included in the repository.

### Code Explanation

The code is organized into different modules to manage various aspects of the educational management system. Each module corresponds to the features outlined in the Database Model.
