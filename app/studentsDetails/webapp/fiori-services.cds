using mysrvdemo as serviceStudent from '../../../srv/mysimplesrv';


annotate serviceStudent.GetStudent with @(UI: {

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
