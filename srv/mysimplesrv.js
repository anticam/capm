const cds = require("@sap/cds");

// namespace of the entities
const { Students } = cds.entities("myCompany.hr.lms");


module.exports = (srv) => {

    srv.on("READ", "StudentSRV", (req, res) => {
        console.log("hello");

        const { SELECT } = cds.ql;
        const result = SELECT.from(Students);
        console.log(result);
        return result;

    });
};


