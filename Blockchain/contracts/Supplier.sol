pragma solidity ^0.4.26;
contract Supplier {
  event ItemAdded(uint idItem);
  event ProcessAnOrder(uint idOfCustomer, uint idOrder, bool status);

  struct Item {
    uint idItem;
    string itemName;
    uint price;
  }

  struct Orderlog {
    uint idCustomer;
    uint idOrder;
    bool status;
  }

  // STATE Variables.
  uint numberOfItemsAvailableForSale;
  uint numberOfOrdersProcessed;

  // Mappings
  mapping (uint => Item) items;
  mapping (uint => Orderlog) orderLogs;


  /* TRANSACTIONS */
  function addItem(string itemName, uint price) public {
    uint idItem = numberOfItemsAvailableForSale++;
    items[idItem] = Item(idItem, itemName, price);
    emit ItemAdded(idItem);
  }

  function processOrder(uint idOrder, uint idCustomer) public {
    orderLogs[idOrder] = Orderlog(idCustomer, idOrder, true);
    numberOfOrdersProcessed ++;
    emit ProcessAnOrder(idCustomer, idOrder, true);
  }

  /* GETTERS */
  function getItem(uint idItem) view public returns (string, uint){
    return (items[idItem].itemName, items[idItem].price);
  }

  function getStatus(uint idOrder) view public returns (bool) {
    return (orderLogs[idOrder].status);
  }

  function getTotalNumberOfAvailableItems() view public returns (uint) {
    return numberOfItemsAvailableForSale;
  }

  function getTotalNumberOfOrdersProcessed() view public returns (uint){
    return numberOfOrdersProcessed;
  }

}
