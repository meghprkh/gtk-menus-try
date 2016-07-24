public class ValaGtk.Application : Gtk.Application {
	public Application () {
		Object(application_id: "org.gnome.valagtk",
				flags: ApplicationFlags.FLAGS_NONE);

		SimpleAction simple_action = new SimpleAction ("incendio", null);
		simple_action.activate.connect (() => {
			this.hold ();
			stdout.printf ("simple action %s activated\n", simple_action.get_name ());
			this.release ();
		});
		this.add_action (simple_action);
		SimpleAction stateful_action = new SimpleAction.stateful ("expelliarmus", VariantType.STRING, new Variant.string ("a1"));
		stateful_action.activate.connect ((to) => {
			stdout.printf ("action %s activated\n", stateful_action.get_name ());
			this.hold ();
			stateful_action.set_state (to);
			print (@"state change to $(to.get_string())\n");
			this.release ();
		});
		this.add_action (stateful_action);
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
