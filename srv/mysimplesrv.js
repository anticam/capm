const cds = require("@sap/cds");

// namespace of the entities
const { Students } = cds.entities("myCompany.hr.lms");


module.exports = (srv) => {

    srv.on("READ", "StudentSRV", async (req, res) => {
        console.log("hello");

        const { SELECT } = cds.ql;
        const aFilter = req.query.SELECT.from.ref[0].where;
        console.log(aFilter);
        //const result = await SELECT.from(Students).where({ email: "demo@demo.com" });
        if (typeof aFilter === "undefined") {
            // let tempResult = await SELECT.from(Students).limit(2);
            let tempResult = await SELECT.from(Students);
            // tempResult = tempResult.filter(row => row.first_name === "john");
            return tempResult;
        }
        const result = await SELECT.from(Students).where(aFilter);
        // const result = await SELECT.from(Students).where(
        //    { email: aFilter[2].val });
        console.log("E-mail: " + aFilter[2].val);

        return result;
    });
}



// req.query.SELECT.from.ref[0].where[2].val
// 'demo@demo.com'

// demoP = new Promise()
// demoP
//    .then((resolve, reject) => {
//        // code when resolved
//        result = value;
//    })
//    .catch(err => {
//
//    })
//    .final(() => {
//
//    });



