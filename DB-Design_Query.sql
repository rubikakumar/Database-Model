CREATE TABLE `Students` (
  `student_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) UNIQUE NOT NULL,
  `contact_number` VARCHAR(15),
  `date_of_birth` DATE,
  `address` VARCHAR(250),
  `enrollment_date` DATE,
  `status` ENUM('active', 'inactive') DEFAULT 'active'
);

CREATE TABLE `Instructors` (
  `instructor_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) UNIQUE NOT NULL,
  `contact_number` VARCHAR(15)
);

CREATE TABLE `Courses` (
  `course_id` INT PRIMARY KEY AUTO_INCREMENT,
  `course_name` VARCHAR(150) NOT NULL,
  `start_date` DATE,
  `instructor_id` INT,
  FOREIGN KEY (`instructor_id`) REFERENCES `Instructors` (`instructor_id`)
);

CREATE TABLE `Lessons` (
  `lesson_id` INT PRIMARY KEY AUTO_INCREMENT,
  `lesson_title` VARCHAR(150) NOT NULL,
  `content` TEXT,
  `course_id` INT,
  FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
);

CREATE TABLE `Assignments` (
  `assignment_id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(150) NOT NULL,
  `description` TEXT,
  `due_date` DATE,
  `course_id` INT,
  FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
);

CREATE TABLE `Submissions` (
  `submission_id` INT PRIMARY KEY AUTO_INCREMENT,
  `assignment_id` INT,
  `student_id` INT,
  `submission_date` DATE,
  `content` TEXT,
  FOREIGN KEY (`assignment_id`) REFERENCES `Assignments` (`assignment_id`),
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`)
);

CREATE TABLE `Batches` (
  `batch_id` INT PRIMARY KEY AUTO_INCREMENT,
  `batch_name` VARCHAR(100) NOT NULL,
  `course_id` INT,
  `start_date` DATE NOT NULL,
  `end_date` DATE,
  FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
);

CREATE TABLE `Enrollments` (
  `enrollment_id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `batch_id` INT,
  `enrollment_date` DATE NOT NULL,
  `status` ENUM('active', 'completed', 'dropped') DEFAULT 'active',
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  FOREIGN KEY (`batch_id`) REFERENCES `Batches` (`batch_id`)
);

CREATE TABLE `Feedback` (
  `feedback_id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `course_id` INT,
  `instructor_id` INT,
  `feedback_text` TEXT,
  `rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  `submission_date` DATE NOT NULL,
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`),
  FOREIGN KEY (`instructor_id`) REFERENCES `Instructors` (`instructor_id`)
);

CREATE TABLE `Attendance` (
  `attendance_id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `lesson_id` INT,
  `date` DATE NOT NULL,
  `status` ENUM('present', 'absent', 'excused') DEFAULT 'present',
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  FOREIGN KEY (`lesson_id`) REFERENCES `Lessons` (`lesson_id`)
);

CREATE TABLE `Certificates` (
  `certificate_id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `course_id` INT,
  `issue_date` DATE NOT NULL,
  `certificate_url` VARCHAR(255),
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
);

CREATE TABLE `Leaderboard` (
  `rank` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `batch_id` INT,
  `learning` DECIMAL(5, 2) NOT NULL,
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  FOREIGN KEY (`batch_id`) REFERENCES `Batches` (`batch_id`)
);
