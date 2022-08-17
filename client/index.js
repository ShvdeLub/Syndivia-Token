const provider = new ethers.providers.Web3Provider(window.ethereum)

// MetaMask requires requesting permission to connect users accounts
await provider.send("eth_requestAccounts", []);

// The MetaMask plugin also allows signing transactions to
// send ether and pay to change state within the blockchain.
// For this, you need the account signer...
const signer = provider.getSigner()

let sendrqstbtn = document.querySelector(". sendrequest")
let container = document.querySelector(". container")
sendrqstbtn.addEventListener("click", function() {
    const sendbtn = document.createElement("button")
    sendbtn.id = "send"
    const inputAmount = document.createElement("input").setAttribute("type", "number")
    const toAddress = document.createElement("input").setAttribute("type", "text")
    container.appendChild(snedbtn, inputAmount, toAddress)
})