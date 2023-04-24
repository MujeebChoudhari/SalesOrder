using my.salesorder as my from '../db/data-model';

service CatalogService {
    entity Customer   as projection on my.Customer;
    entity Order      as projection on my.Order;
    entity Order_Item as projection on my.Order.Items;
}
