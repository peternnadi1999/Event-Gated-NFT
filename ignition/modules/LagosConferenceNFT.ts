import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const LagosConferenceNFTModule = buildModule("LagosConferenceNFTModule", (m) => {
 
  const lagosConferenceNFT = m.contract("LagosConferenceNFT");

  return { lagosConferenceNFT };
});

export default LagosConferenceNFTModule;
