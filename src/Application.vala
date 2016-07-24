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
		SimpleAction stateful_action = new SimpleAction.stateful ("expelliarmus", null, new Variant.string ("a1"));
		stateful_action.activate.connect ((to) => {
			stdout.printf ("action %s activated\n", stateful_action.get_name ());
			print (@"$(to.get_string())\n");

			/*this.hold ();
			Variant state = stateful_action.get_state ();
			bool b = state.get_boolean ();
			stateful_action.set_state (new Variant.boolean (!b));
			stdout.printf ("state change %s -> %s\n", b.to_string (), (!b).to_string ());
			this.release ();*/
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
