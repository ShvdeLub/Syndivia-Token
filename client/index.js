let accounts = []
let connectbtn = document.querySelector(".connected")
connectbtn.addEventListener("click", function() {
    getaccount()
    connectbtn.innerHTML = accounts + " connected"
})
async function getaccount() {
    accounts = await ethereum.request({ method: "eth_requestAccounts" })
}


let sendrqstbtn = document.querySelector(".sendrequest")
let container = document.querySelector(".container")
let balanceofbtn = document.querySelector(".balanceOf")
let inputaddress = document.querySelector(".address")
sendrqstbtn.addEventListener("click", function() {
    const sendbtn = document.createElement("button")
    sendbtn.id = "send"
    const inputAmount = document.createElement("input").setAttribute("type", "number")
    const toAddress = document.createElement("input").setAttribute("type", "text")

    container.appendChild(sendbtn, inputAmount, toAddress)
})

balanceofbtn.addEventListener("click", async function () {
    if ((inputaddress.value).length == 20) {
        const balance = await accounts.getBalance(inputaddress.value)
        balanceofbtn.innerHTML = "balance of :" + inputaddress.value + " = " + balance
    }
    else {console.log("please enter an address")}
})
