import App from './App';
import './index.scss';
import { UpdateCallRejectedError } from "@dfinity/agent";
import { hello_backend } from "../../declarations/hello_backend";

const app = new App();

document.querySelector(".vote-anne").addEventListener("click", async function(event) {
    await hello_backend.add_voters("Anne");
    displayVoters();
})

document.querySelector(".vote-jenni").addEventListener("click", async function(event) {
    await hello_backend.add_voters("Jenni");
    displayVoters();
})

document.querySelector(".vote-mike").addEventListener("click", async function(event) {
    await hello_backend.add_voters("Mike");
    displayVoters();
})

document.querySelector(".vote-thomas").addEventListener("click", async function(event) {
    await hello_backend.add_voters("Thomas");
    displayVoters();
})

async function displayVoters() {
    const votersNumber = document.querySelectorAll(".voters-number");
    votersNumber.forEach(part => {
        part.style.display = "inline";
    });

    const anneVoters = await hello_backend.checkVoters("anne");
    const jenniVoters = await hello_backend.checkVoters("jenni");
    const mikeVoters = await hello_backend.checkVoters("mike");
    const thomasVoters = await hello_backend.checkVoters("thomas");
    document.querySelector(".anne-voters").innerText = anneVoters;
    document.querySelector(".jenni-voters").innerText = jenniVoters;
    document.querySelector(".mike-voters").innerText = mikeVoters;
    document.querySelector(".thomas-voters").innerText = thomasVoters;
}
