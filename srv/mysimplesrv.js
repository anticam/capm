

module.exports = (srv) => {

    srv.before("READ", "StudentSRV", (req, res) => {
        console.log("hello");

    });
};


