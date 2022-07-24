
pragma solidity ^0.4.26;

contract Customer {

  /* Events */
  event OrderRaisedOrUpdated(uint idOrder);
  struct AvailableCustomer {
    uint idCustomer;
    string customerName;
  }

  struct Orderlog {
    uint idOrder;
    uint idCustomer;
    string itemName;
    uint quantity;
    bool status;
  }

  // STATE Variables.
  uint numberOfItemsPurchased;
  uint numberOfItemsReceived;

  // Mappings 
  mapping (uint => AvailableCustomer) customers;
  mapping (uint => Orderlog) orderLogs;

  /* Constructor */
  constructor() public {
      /* For the case of demo, adding a customer in constructor. You can take this idea and extend the contract to contain addCustomer section and hence maintain customerDB in the Blockchain! */
      customers[0] = AvailableCustomer(1, "John Snow");
  }

  /* TRANSACTIONS */
  function purchaseItem(string itemName, uint quantity) public {
    uint idOrder = numberOfItemsPurchased++;
    orderLogs[idOrder] = Orderlog(idOrder, 0, itemName, quantity, false);
    emit OrderRaisedOrUpdated(idOrder);
  }

  function recieveItem(uint idOrder) public {
      numberOfItemsReceived++;
      orderLogs[idOrder].status = true;
      emit OrderRaisedOrUpdated(idOrder);
  }

  /* GETTERS */
  function getOrderDetails(uint idOrder) view public returns (string, uint, bool){
    return (orderLogs[idOrder].itemName, orderLogs[idOrder].quantity, orderLogs[idOrder].status);
  }

  function getNumberOfItemsPurchased() view public returns (uint) {
    return numberOfItemsPurchased;
  }

  function getNumberOfItemsReceived() view public returns (uint) {
    return numberOfItemsReceived;
  }

}
