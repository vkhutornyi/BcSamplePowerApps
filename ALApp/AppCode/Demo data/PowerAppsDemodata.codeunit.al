codeunit 51001 PowerAppsDemoDataGenerator
{

    procedure GenerateDemoDataForTakeWarehouseHelper()
    var
        itemRecord: Record Item;
    begin
        // What is a good way to add gtin (barcodes) to items?
        itemRecord.FindFirst();
        itemRecord.Validate(GTIN, '0000000000000');
        itemRecord.Modify(true);
    end;

    procedure GenerateDemoDataForTakeMyOrder()
    var
        customerRecord: Record Customer;
        itemRecord: Record Item;
    begin
        // Add tables
        AddCustomer('Table 1');
        AddCustomer('Table 2');
        AddCustomer('Table 3');
        AddCustomer('Table 4');
        AddCustomer('Table 5');
        AddCustomer('Table 6');

        // Add item catagories
        AddItemCatagories('Warm drinks', 'warmDrinks');
        AddItemCatagories('Cold drinks', 'coldDrinks');
        AddItemCatagories('Dessert', 'drinkAndPastries');

        // Add items
        AddItem('W0001', 'Caffè', 'warmDrinks', '', 'Hawaii dark roast has scents of cedar and roasted hazelnuts with flavors of chocolate, toasted nuts, and a tangy strawberry finish.', 2.00);
        AddItem('W0002', 'Caffè Doppio', 'warmDrinks', '', 'Brazil medium roast: chocolate, honey, caramel notes, and a deep finish. Low-acidity for a smoother cup.', 3.00);
        Additem('W0003', 'Americano', 'warmDrinks', '', 'This organic light roast from Costa Rica offers a nutty taste profile balanced with hints of caramel and vanilla.', 2.00);
        AddItem('W0004', 'Cappuccino', 'warmDrinks', 'Lactose', 'Indonesia medium roast, dry-processed, with delicate acidity and silky texture. Notes of floral, fruit, citrus, caramel, and nuts.', 4.00);
        AddItem('W0005', 'Tea', 'warmDrinks', '', 'Choose between Earl Grey, Breakfast, Lemongrass & Ginger or Organic Chai', 3.00);
        AddItem('C0001', 'Water', 'coldDrinks', '', 'Sparkling water', 1.00);
        AddItem('C0002', 'Smoothie', 'coldDrinks', 'Nuts, lactose', 'Strawberry (frozen) with banana, yogurt, and almond milk', 4.50);
        AddItem('C0003', 'Coke Zero', 'coldDrinks', '', '25 cl Coke Zero with ice', 2.00);
        AddItem('C0004', 'Frappuccino', 'coldDrinks', 'Lactose', 'Espresso with milk, crushed ice and whipped cream', 5.00);
        AddItem('C0005', 'Cold brew', 'coldDrinks', 'Lactose', 'Cold brewed coffee with crushed ice and milk', 3.00);
        AddItem('P0001', 'Croissant', 'drinkAndPastries', '', 'French croissant based on the recipe from ”Des substances alimentaires”, 1853', 2.50);
        AddItem('P0002', 'Scone', 'drinkAndPastries', 'Nuts, lactose, gluten', 'British scone with raisins served with butter and jam', 2.50);
        AddItem('P0003', 'Cinnamon bun', 'drinkAndPastries', 'Lactose, gluten', 'Classic Swedish “kanelbulla” recipe with both ground cinnamon, cardamom and pearl sugar', 3.00);
        AddItem('P0004', 'Chocolate muffin', 'drinkAndPastries', 'Nuts, lactose, gluten', 'Moist American quickbread muffin with chocolate chip', 3.50);
        AddItem('P0005', 'Lemon tart', 'drinkAndPastries', 'Lactose, gluten', 'Pastry base with lemon curd topped with meringue', 4.00);
        AddItem('P0006', 'Blueberry pie', 'drinkAndPastries', 'Nuts, lactose, gluten', 'Hazelnut pie base with Finnish blueberry, vanilla cream, milk chocolate and mint', 4.00);
    end;


    procedure AddCustomer(customerName: Text)
    var
        customerRecord: Record Customer;
    begin
        customerRecord.Init();
        customerRecord.Validate(Name, customerName);
        customerRecord.Validate(IsTable, true);
        customerRecord.Validate("Customer Posting Group", 'domestic');
        customerRecord.Insert(true);
    end;

    procedure AddItemCatagories(temp: Text; temp1: Text)
    var
        itemCatagory: Record "Item Category";
    begin
        itemCatagory.Init();
        itemCatagory.Validate(description, temp);
        itemCatagory.Validate(Code, temp1);
        itemCatagory.Insert(true);
    end;

    procedure AddItem(ItemNumber: Text; ItemName: Text; itemCategory: Text; allergenInformation: Text; longDescription: Text; unitPrice: Decimal)
    var
        itemRecord: Record Item;
    begin
        itemRecord.Init();

        itemRecord.Validate("No.", ItemNumber);
        itemRecord.Validate(Description, ItemName);
        itemRecord.Validate("Unit Price", unitPrice);
        itemRecord.Validate("Item Category Code", itemCategory);
        itemRecord.Validate(LongItemDescription, longDescription);
        itemRecord.Validate(AllergenInformation, allergenInformation);
        itemRecord.Validate("Inventory Posting Group", 'services');
        itemRecord.Validate("Gen. Prod. Posting Group", 'finished');
        itemRecord.Validate(SoldInRestaurant, true);
        // itemRecord.Validate(Picture, ?????);

        itemRecord.Insert(true);
    end;
}