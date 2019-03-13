using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItem
{
    //constructors
    public CartItem() { }
    public CartItem(Note note)
    {
        this.Note = note;
    }

    //public properties
    public Note Note { get; set; }



    //display item's property values
    public string Display()
    {
        string display = string.Format("{0} By: {1} For Course: {2} )",
            Note.NoteTitle, Note.Author,
            Note.CourseCode);
        return display;
    }
}