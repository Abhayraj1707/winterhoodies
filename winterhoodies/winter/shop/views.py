from django.shortcuts import render
from django.db.models import Q
from .models import Product, Orders, Message, OrderStatus
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from math import ceil
from django.http import HttpResponse
import json
from django.views.decorators.csrf import csrf_exempt
from PayTm import Checksum
MERCHANT_KEY = 'bKMfNxPPf_QdZppa';

# Display the home page after fetching products
# from Product table according to search query if searched
# else all products
def index(request):
    products = Product.objects.all()
    if(request.method=="GET"):
        query = request.GET.get('query', '')
        products = Product.objects.filter(Q(product_name__icontains=query) | Q(tagline__icontains=query) | Q(desc__icontains=query))

    no_of_product_in_a_page = 3
    n = len(products)
    nSlides = n//no_of_product_in_a_page + 1
    # Django pagination automatically handles pagination
    page = request.GET.get('page', 1)
    paginator = Paginator(products, no_of_product_in_a_page)
    try:
        items = paginator.page(page)
    except PageNotAnInteger:
        items = paginator.page(1)
    except EmptyPage:
        items = paginator.page(paginator.num_pages)
    params = {'no_of_slides': nSlides, 'range': range(1, nSlides+1), 'itemcount': n, 'items': items}
    return render(request, 'shop/index.html', params)


# Display product details of selected product
def product_details(request, myid):
    # Fetch the product using id
    product = Product.objects.filter(id=myid)
    return render(request, 'shop/product_detail.html', {'product':product[0]})

# Display cart
def cart(request):
    return render(request, 'shop/cart.html')

# To checkout take details and creates entry in order and order staus
# database and update product database by decreasing the quantity of ordered product
def checkout(request):
    if(request.method=="POST"):
        itemsjson = request.POST.get('itemsjson', 'default')
        fname = request.POST.get('fname', 'default')
        lname = request.POST.get('lname', 'default')
        branch = request.POST.get('branch', 'default')
        reg_id = request.POST.get('reg_id', 'default')
        mobno = request.POST.get('mobno', 'default')
        email = request.POST.get('email', 'default')
        address = request.POST.get('address1', 'default') + " " + request.POST.get('address2', 'default')
        city = request.POST.get('city', 'default')
        zip_code = request.POST.get('zip_code', 'default')
        state = request.POST.get('state', 'default')
        comment = request.POST.get('comment', 'default')
        items_json = json.loads(itemsjson)

        # Calculating total price
        totalprice = 0
        for item in items_json.values():
            totalprice += int(item[2]) * int(item[3])

        # Cretes entry in order table
        order = Orders(items_json=itemsjson, fname=fname, lname=lname, branch=branch, reg_id=reg_id, mobno=mobno, email=email, address=address, city=city, zip_code=zip_code, state=state, comment=comment, amount=totalprice)
        order.save()

        # Create entry in order status table
        orderstatus = OrderStatus(orderid=order.order_id, orderstatus="Order Recieved just now and sent for packing.")
        orderstatus.save()


        thank = True
        order_id = order.order_id
        mydict = json.loads(itemsjson)
        # Update the quantity of each product in database which is ordered
        # (i.e decrease the amount of quantity )
        for key in mydict:
            product_id = mydict[key][6]
            types = mydict[key][7]
            prdouct_qnty = mydict[key][2]
            updateProductDb(product_id, types, prdouct_qnty)

        # Sending essentials parameters to javascript file attached to redirect to take receipt
        return render(request, 'shop/checkout.html', {'thank': thank, 'id': order_id})
    return render(request, 'shop/checkout.html')


# Utility function which will accept post request generated
# from javascript file and return the available qunatity of requested
# product id after checking data
def checkdb(request):
    data = json.loads(request.body.decode("utf-8"))
    id = int(data['id'])
    types = data['type']
    qnty = find_qnty(id, types)
    return HttpResponse(qnty)

# Generate receipt
def receipt(request, orderid):
    order = Orders.objects.filter(order_id=orderid)[0]
    items_json = json.loads(order.items_json)
    customer_name = order.fname + " " + order.lname
    address = order.address
    email = order.email
    totalprice =0
    for item in items_json.values():
        totalprice += int(item[2]) * int(item[3])
    products = {'name': customer_name, 'address': address, 'email': email, 'orderid': orderid, 'items_json': items_json, 'grandtotal': totalprice }
    return render(request, 'shop/receipt.html', products)


# Store the message sent by customer in to database
def contact(request):
    if (request.method == "POST"):
        name = request.POST.get('name', 'default')
        email = request.POST.get('email', 'default')
        msg = request.POST.get('message', 'default')
        msgObj = Message(name=name, email=email, message=msg)
        msgObj.save()
        thank = True
        return render(request, 'shop/contact.html', {'thank': thank})
    return render(request, 'shop/contact.html')


# Gives the order status after fetching from database
def track(request):
    if (request.method == "POST"):
        try:
            orderid = request.POST.get('orderid', '')
            message = OrderStatus.objects.filter(orderid=orderid)[0].orderstatus
        except Exception as e:
            message = "Invalid Order Id"

        thank = True
        return render(request, 'shop/track.html', {'thank': thank, 'message': message})
    return render(request, 'shop/track.html')


# Updates the product database
def updateProductDb(id, types, qnty):
    product = Product.objects.filter(id=id)[0]
    if types == 'sblue':
        product.sblue = product.sblue - qnty
    elif types == 'mblue':
        product.mblue = product.mblue - qnty
    elif types == 'lblue':
        product.lblue = product.lblue - qnty
    elif types == 'sblack':
        product.sblack = product.sblack - qnty
    elif types == 'mblack':
        product.mblack = product.mblack - qnty
    elif types == 'lblack':
        product.lblack = product.lblack - qnty
    product.save()


# Returns the qnty available in database
def find_qnty(id, types):
    product = Product.objects.filter(id=id)[0]
    if types == 'sblue':
        return product.sblue
    elif types == 'mblue':
        return product.mblue
    elif types == 'lblue':
        return product.lblue
    elif types == 'sblack':
        return product.sblack
    elif types == 'mblack':
        return product.mblack
    elif types == 'lblack':
        return product.lblack





'''
# This is for paytm payment integration due to unavailablity of merchant id & key i m commenting this part
# Also add [ path('handlerequest/', views.handlerequest, name="Handlerequest"), ] in urls.py when to use
@csrf_exempt
def handlerequest(request):
    # paytm will send you post request here
    form = request.POST
    response_dict = {}
    for i in form.keys():
        response_dict[i] = form[i]
        if i == 'CHECKSUMHASH':
            checksum = form[i]

    verify = Checksum.verify_checksum(response_dict, MERCHANT_KEY, checksum)
    if verify:
        if response_dict['RESPCODE'] == '01':
            print('order successful')
        else:
            print('order was not successful because' + response_dict['RESPMSG'])
    return render(request, 'shop/paymentstatus.html', {'response': response_dict})
'''

'''
# Handle the checkout when paytm payment integration
# when merchant id and key is available uncomment this comment the
# the function defined above with same 
def checkout(request):
    if(request.method=="POST"):
        itemsjson = request.POST.get('itemsjson', 'default')
        fname = request.POST.get('fname', 'default')
        lname = request.POST.get('lname', 'default')
        branch = request.POST.get('branch', 'default')
        reg_id = request.POST.get('reg_id', 'default')
        mobno = request.POST.get('mobno', 'default')
        email = request.POST.get('email', 'default')
        address = request.POST.get('address1', 'default') + " " + request.POST.get('address2', 'default')
        city = request.POST.get('city', 'default')
        zip_code = request.POST.get('zip_code', 'default')
        state = request.POST.get('state', 'default')
        comment = request.POST.get('comment', 'default')
        items_json = json.loads(itemsjson)
        # print("item json is", items_json, "and its type is ", type(items_json))
        totalprice = 0
        for item in items_json.values():
            totalprice += int(item[2]) * int(item[3])
        # print("total price is ", totalprice)
        order = Orders(items_json=itemsjson, fname=fname, lname=lname, branch=branch, reg_id=reg_id, mobno=mobno, email=email, address=address, city=city, zip_code=zip_code, state=state, comment=comment, amount=totalprice)
        order.save()
        thank = True
        order_id = order.order_id

        mydict = json.loads(itemsjson)
        for key in mydict:
            product_id = mydict[key][6]
            types = mydict[key][7]
            prdouct_qnty = mydict[key][2]
            # Update the quantity of products in products database which is ordered
            # (i.e decrease the amount of quantity )
            updateProductDb(product_id, types, prdouct_qnty)
        # return render(request, 'shop/checkout.html', {'thank': thank, 'id': order_id})
        # Request paytm to transfer the amount to your account after payment by
        param_dict = {
            'MID': 'DIY12386817555501617',
            'ORDER_ID': str(order.order_id),
            'TXN_AMOUNT': str(totalprice),
            'CUST_ID': email,
            'INDUSTRY_TYPE_ID':'Retail',
            'WEBSITE': 'DIYtestingweb',
            'CHANNEL_ID': 'WEB',
            'CALLBACK_URL': 'http://127.0.0.1:8000/shop/handlerequest/',
        }
        param_dict['CHECKSUMHASH'] = Checksum.generate_checksum(param_dict, MERCHANT_KEY)
        return render(request, 'shop/paytm.html', {'param_dict': param_dict})
    return render(request, 'shop/checkout.html')
'''
