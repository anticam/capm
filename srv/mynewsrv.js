const cds = require("@sap/cds");

// namespace of the entities
const { Students } = cds.entities("myCompany.hr.lms");


module.exports = (srv) => {

    srv.before("CREATE", "InsertStudent", async (req, res) => {

        //const { SELECT } = cds.ql;
        //const result = await SELECT.from(Students);
        //return result;


    });

};

