import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const EventRegistrationModule = buildModule("EventRegistrationModule", (m) => {
 
  const eventRegistration = m.contract("EventRegistration");

  return { eventRegistration };
});

export default EventRegistrationModule;
