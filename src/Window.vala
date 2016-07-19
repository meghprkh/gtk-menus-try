[GtkTemplate (ui = "/org/gnome/ValaGtk/app.ui")]
public class ValaGtk.Window : Gtk.Window {
	[GtkChild]
	Gtk.Box box;

	construct {
		print ("Hello World!\n");
		var builder = new Gtk.Builder.from_resource ("/org/gnome/ValaGtk/menu.ui");
		var menu = (MenuModel) builder.get_object ("menu");
		var button = new Gtk.MenuButton ();
		button.menu_model = menu;
		button.use_popover = true;
		box.add (button);
	}
}
