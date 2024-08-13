//const cds = require("@sap/cds");

// namespace of the entities
//const { Students } = cds.entities("myCompany.hr.lms");


module.exports = (srv) => {

    srv.before("CREATE", "InsertStudent", async (req, res) => {

        // check email are note personal gmail

        if (req.data.email === "undefined") {
            req.error(500, "Email is missing");
        }
        if (req.data.email.toLowerCase().indexOf("gmail") !== -1) {
            req.error(500, "Personal Email ID not allowed");
        }


        //const { SELECT } = cds.ql;
        //const result = await SELECT.from(Students);
        //return result;


    });

};

