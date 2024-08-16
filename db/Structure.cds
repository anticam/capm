namespace myCompany.hr.lms1;

// myCompany.hr.lms1.Contents.csv
// myCompany.hr.lms1.Courses.csv
// myCompany.hr.lms1.Enrollments.csv
// myCompany.hr.lms1.Students

entity Contents {
    key ID             : Integer;
        url            : String(2048);
        data_published : Date;
        content_type   : String(20);
        course         : Association to Courses;

}

entity Courses {
    key ID               : Integer;
        course_name      : String(100);
        course_duration  : DecimalFloat;
        course_price     : Decimal(5, 2);
        published_status : Boolean;
        content          : Association to many Contents
                               on content.course = $self;
        enrollment       : Association to many Enrollments
                               on enrollment.course = $self;

}

entity Enrollments {

    key ID      : Integer;
        course  : Association to Courses;
        student : Association to Students; // 1 to n association

}

entity Students {
    key email        : String(50);
        first_name   : String(40);
        last_name    : String(40);
        date_sign_up : Date;
        enrollment   : Association to many Enrollments
                           on enrollment.student = $self;

}
