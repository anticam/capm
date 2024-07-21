namespace myCompany.hr.lms;

entity Students {
    key email        : String(65) @(title: 'Email');
    key first_name   : String(20) @(title: 'First Name');
        last_name    : String(20);
        date_sign_up : Date;
};
