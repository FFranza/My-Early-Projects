# Online Store Management
# Tasked with building a Online Store Management
# Objectives:
    # Product Class, Customer Class, Order Class, and Store Class.
# Dictionary variable for products
products_by_category =  {
    'electronics': [],
    'books': [],
    'clothing': [],
}
# Add more based on format: "'Category_name': []," 
class product:
    def __init__(self, product_id, name, price, quantity_in_stock, category):
        self.prid = product_id
        self.name = name
        self.price = price
        self.qis = quantity_in_stock
        self.cty = category

        # Add to the product inine with category
        products_by_category[category].append(self)
    
    def get_product_info(self): # Allows calling for information from class abnd is used to keep currented updated information.
        return f"{self.prid} - {self.name}, Price: ${self.price}, Stock: {self.name}"

    def adding_qis(self, quantity):
        if quantity > 0: # Checks if value is applicable for adding products, disallows negative or non real numbers.
            self.qis += quantity
            print (f"Added {quantity} units to {self.name} to the new stock. Current stock is: {self.qis}")
        else:
            print ("Invalid amount, please recheck. Stock is not updated.")

    def sell(self, quantity):
        if 0 < quantity <= self.qis: # Checks if quantity can be sold if quantity is can be sold
            self.qis -= quantity
            print (f"Sold {quantity} units of {self.name}. Current stock is {self.qis}")
            return True
        elif quantity <= 0: # Checks if value can be reduced properply either by using proper values or stock is still present
            print ("Invalid quantity, stock has not been updated")
        else:
            print (f"Insufficient amount of quantity, {self.name} has not be sold and stock has not been updated")
