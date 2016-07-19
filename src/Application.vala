public class ValaGtk.Application : Gtk.Application {
	public Application () {
		Object(application_id: "org.gnome.valagtk",
				flags: ApplicationFlags.FLAGS_NONE);
	}

	protected override void activate () {
		// Create the window of this application and show it
		var window = new Window ();
		window.show_all ();
		this.add_window (window);
		window.destroy.connect (() => {
			quit ();
		});
	}
}
