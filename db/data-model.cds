namespace my.salesorder;

using {
    cuid,
    managed,
    Currency,
    User
} from '@sap/cds/common';

entity Customer : cuid, managed {
    ID           : Double;
    customerName : String;
    creationDate : Date;
    totalOrder   : Double;
}

entity Order : cuid, managed {
    orderID   : String(22) @title: 'Order Number';
    orderDate : Date;
    Items     : Composition of many {
                    key ID       : UUID;
                        product  : Association to Products;
                        quantity : Integer;
                        title    : String;
                        price    : Double;
                };
    buyer     : Association to Customer;
    amount    : Double;
    currency  : Currency;
}

entity Products @(cds.persistence.skip: 'always') {
    key ID : String;
}
