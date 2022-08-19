let accounts = []
let connectbtn = document.querySelector("#connected")
connectbtn.addEventListener("click", function() {
    getaccount()
    connectbtn.innerHTML = accounts + " connected"
})
async function getaccount() {
    accounts = await ethereum.request({ method: "eth_requestAccounts" })
}



let sendrqstbtn = document.querySelector("#sendrequest")
let container = document.querySelector("#container")
let balanceofbtn = document.querySelector("#balanceOf")
let inputaddress = document.querySelector("#address")

async function getBalanceOf() {
    alert(inputaddress.value.toString())
try {
    const balance = await accounts[0].getBalance("0x129a7B41E2b3CdAf67062BccECd95fCfEC6E2a0B")
    balanceofbtn.innerHTML = "balance of :" +  inputaddress.value.toString() + " = " + balance.toString()
    
} catch (error) {
    console.log(error)
    console.log("raté")
}

   
}

sendrqstbtn.addEventListener("click", function() {
    const sendbtn = document.createElement("button")
    sendbtn.id = "send"
    const inputAmount = document.createElement("input").setAttribute("type", "number")
    const toAddress = document.createElement("input").setAttribute("type", "text")

    container.appendChild(sendbtn, inputAmount, toAddress)
})

