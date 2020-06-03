# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products = Product.create(
    [
        { 
            name: 'Active Bike', 
            description: 'Wonderful', 
            image_url: '/images/activebike.jpg', 
            colour: 'Silver', 
            price: '80 €' 
        }, 
        { 
            name: 'Summer Bike', 
            description: 'OK Bike', 
            image_url: '/images/summerbike.jpg', 
            colour: 'White', 
            price: '50 €' 
        }, 
        { 
            name: 'Tandem Bike', 
            description: 'Awesome Bike', 
            image_url: '/images/tandem.jpg', 
            colour: 'Red', 
            price: '90 €' 
        }, 
        { 
            name: "Girl/'s Bike", 
            description: 'Cute Bike', 
            image_url: '/images/citybike.jpg', 
            colour: 'Pink', 
            price: '50 €' 
        }, 
        { 
            name: "Women/'s Bike", 
            description: 'Nice Bike', 
            image_url: '/images/mybike.jpg', 
            colour: 'Black', 
            price: '80 €' 
        }, 
        { 
            name: 'Mountain Bike', 
            description: 'Cool Bike', 
            image_url: '/images/mountainbike.jpg', 
            colour: 'Black', 
            price: '90 €' 
        }, 
        { 
            name: 'Finnish Bike', 
            description: 'Great Bike', 
            image_url: '/images/jopo2.jpg', 
            colour: 'Red', 
            price: '80 €' 
        }, 
        { 
            name: "Grandma/'s Bike", 
            description: 'Beautiful', 
            image_url: '/images/grandmasbike2.jpg', 
            colour: 'Red', 
            price: '70 €' 
        }, 
        { 
            name: 'Street Bike', 
            description: 'Cool Bike', 
            image_url: '/images/streetbike.jpg', 
            colour: 'Orange', 
            price: '90 €' 
        }
    ]
)