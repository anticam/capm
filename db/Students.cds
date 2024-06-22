namespace myCompany.hr.lms;

entity Students {
    key email        : String(65);
        first_name   : String(20);
        last_name    : String(20);
        date_sign_up : Date;
};

annotate Students with @(UI: {

    SelectionFields: [

    ],
    LineItem       : [
        {
            Label: 'Email',
            Value: email,
        },
        {
            Label: 'First Name',
            Value: first_name,
        },
        {
            Label: 'Last Name',
            Value: last_name,
        },

        {
            Label: 'Sign Join',
            Value: date_sign_up,
        }
    ],
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Email',
        TypeNamePlural: 'Emails',
        Description   : {Value: email}
    },
});
