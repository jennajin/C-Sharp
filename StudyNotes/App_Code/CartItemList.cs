using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;

public class CartItemList
{
    //define list of items 
    private List<CartItem> cartItems;
    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }

    //length of list
    public int Count
    {
        get { return cartItems.Count; }
    }

    //search the list by index
    public CartItem this[int index]
    {
        get { return cartItems[index]; }
        set { cartItems[index] = value; }
    }

    //search the list by noteTitle
    public CartItem this[string noteTitle]
    {
        get
        {
            return cartItems.FirstOrDefault(c => c.Note.NoteTitle == noteTitle);
        }
    }

    //get cart object from session
    public static CartItemList GetCart()
    {
        CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
        if (cart == null)
            HttpContext.Current.Session["Cart"] = new CartItemList();
        return (CartItemList)HttpContext.Current.Session["Cart"];
    }

    //add, remove and clear from the list 
    public void AddItem(Note note)
    {
        CartItem item = new CartItem(note);
        cartItems.Add(item);
    }
    public void RemoveAt(int index)
    {
        cartItems.RemoveAt(index);
    }
    public void Clear()
    {
        cartItems.Clear();
    }
}

