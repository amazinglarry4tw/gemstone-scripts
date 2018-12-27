=begin

	REMEMBER: AFK SCRIPTING IS STRICTLY FORBIDDEN IN GS PRIME AND GS PLATNIUM. USAGE OF THIS SCRIPT WHILE NOT PAYING ATTENTION TO THE GAME SCREEN CAN CAUSE YOU TO GET IN TROUBLE WITH GMS IF YOU ARE CAUGHT.
	PLEASE REMEMBER TO PAY ATTENTION TO THE GAME SCREEN WHILE RUNNING THIS SCRIPT IN GS PRIME AND GS PLATNIUM.
	
	Automates all Warrior guild tasks, including partner tasks.

	Must setup the script before using it by typing ;warrior setup

	Type ;warrior help for usage information.

	When script is started with a batter task of battering critter boxes it will batter all boxes on the ground until the boxes are all destroyed or until your task is complete, whichever comes first. Whenever a box is destroyed the script will attempt to pick up all loot off the ground (except for things like herbs and junk and boxes) so be sure to do this in an area where you won't pick up someone else's loot. Also if the task is finished before all boxes are destroyed the script will pick up and stow all boxes before turning in task.

	Author:  Tgo01
	Version:  88

=end
version = 88

shrubbery_names = /hedge|shrub|tree|bush|topiar/i


crate_rooms = [ '9003', '250' ]
sheet_metal_rooms = [ '3455', '8615' ]
###############
#Icemule Rooms:
#Crate Room: 9003
#Sheet Metal Room: 3455
###############
###############
#Landing Rooms:
#Crate Room: 250
#Sheet Metal Room: 8615
###############
###############
#Solhaven Rooms:
#Crate Room: ############### -- Might not exist
#Sheet Metal Room: ############### -- Might not exist
###############


blunt_weapons = /\b(leather whip|bullwhip|cat o\' nine tails|crowbill|cudgel|baculus|club|lisan|periperiu|shillelagh|tambara|truncheon|war club|jo stick|mace|bulawa|flanged mace|knee\-breaker|ridgemace|studded mace|dhara|massuelle|mattina|ox mace|pernat|quadrelle|ball and chain|mace and chain|binnol|goupillon|war hammer|fang|hammerbeak|hoolurge|horseman\'s hammer|taavish|morning\-star|morning star|spiked mace|holy water sprinkler|spikestar)\b/

brawling_weapons = /\b(razorpaw|slap\-slasher|paingrip|grab\-stabber|cestus|knuckle\-duster|hook\-knife|pit\-knife|sabiet|tiger\-claw|knuckle\-blade|slash\-fist|yierka\-spur|spike\-fist|blackjack|bludgeon|sap|jackblade|slash\-jack|troll\-claw|sai|jitte|fist\-scythe|katar|gauntlet\-sword|manople|paicush|pata)\b/

edged_weapons = /\b(pick|dagger|alfange|basilard|bodkin|bracelet dagger|butcher knife|cinquedea|crescent dagger|dirk|fantail dagger|forked dagger|kidney dagger|knife|kozuka|misericord|parazonium|pavade|poignard|pugio|scramasax|sgian achlais|spike|stiletto|tanto|main gauche|parrying dagger|rapier|bilbo|epee|foil|tock|tocke|tuck|colichemarde|fleuret|schlager|tizona|verdun|whip\-blade|katar|gaunlet\-sword|manople|paiscush|pata|short sword|antler sword|braquemar|baselard|chereb|coustille|gladius|kris|sica|wakizashi|scimitar|cutlass|kama|kilij|palache|sabre|sapara|shamshir|yataghan|estoc|koncerz|longsword|arming sword|kaskara|langsax|langseax|sheering sword|balta|broad axe|cleaver|crescent axe|field\-axe|francisca|hatchet|ice axe|limb\-cleaver|meat cleaver|miner\'s axe|moon axe|raiding axe|sparte|taper|toporok|waraxe|backsword|broadsword|carp\'s tongue|flyssa|goliah|katzbalger|machera|schiavona|seax|spadroon|spatha|talon sword|xiphos|falchion|badelaire|craquemarte|falcata|khopesh|machete|takouba|warblade|katana|bastard sword|espadon|cresset sword|warsword)\b/

polearm_weapons = /\b(pilum|spear|angon|boar spear|cateia|falarica|gaesum|harpoon|partisan|partizan|pill|spontoon|trident|fuscina|magari\-yari|pitch fork|zinnor|halberd|bardiche|bill|brandestoc|croc|falcastra|falx|fauchard|glaive|godendag|guisarme|half moon|hippe|pole axe|scorpion|scythe|naginata|jeddart\-axe|beaked axe|nagimaki|voulge|hammer of kai|awl\-pike|chest\-ripper|korseke|military fork|ranseur|runka|scaling fork|spetum|lance|framea|pike|sarissa|sudis|warlance)\b/

twohanded_weapons = /\b(runestaff|crook|crosier|pastoral staff|rune staff|scepter|staff|quarterstaff|bo stick|yoribo|bastard sword|espadon|cresset sword|warsword|katana|military pick|bisacuta|flail|military flail|flamberge|war mattock|mattock|oncin|sabar|maul|footman\'s hammer|sledgehammer|tetsubo|two\-handed sword|battlesword|beheading sword|bidenhander|falx|executioner\'s sword|greatsword|no\-dachi|zweihander|battle axe|adze|balestarius|battle\-axe|bearded axe|doloire|executioner\'s axe|greataxe|kheten|roa\'ter axe|tabar|woodsman\'s axe|claidhmore)\b/

large_weapons = /\b(rapier|bilbo|epee|foil|tock|tocke|tuck|colichemarde|fleuret|schlager|tizona|verdun|whip\-blade|short sword|antler sword|braquemar|baselard|chereb|coustille|gladius|kris|sica|wakizashi|scimitar|cutlass|kama|kilij|palache|sabre|sapara|shamshir|yataghan|estoc|koncerz|longsword|arming sword|kaskara|langsax|langseax|sheering sword|handaxe|balta|broad axe|cleaver|crescent axe|field\-axe|francisca|hatchet|ice axe|limb\-cleaver|meat cleaver|miner\'s axe|moon axe|raiding axe|sparte|taper|toporok|waraxe|backsword|broadsword|carp\'s tongue|flyssa|goliah|katzbalger|machera|schiavona|seax|spadroon|spatha|talon sword|xiphos|falchion|badelaire|craquemarte|falcata|khopesh|machete|takouba|warblade|katana|bastard sword|espadon|cresset sword|warsword)\b/

critter_task_rooms = "#{UserVars.warrior["critter_task_rooms"]}".split(",")
backsheath

CharSettings['boost_time'] = nil unless CharSettings['boost_time']
check_task = nil
check_batter_task = nil
check_guild_status = nil
person = nil
current_task = nil
critter_tasks = nil
critter_task_on_critter = nil
go_to = nil
target_room = nil
wait_for_stamina = nil
message_string = nil
display_message = nil
str = nil
turn_in_task = nil
current_skill_start = nil
current_skill_name = nil
wander_critter_tasks = nil
check_critter_task_status = nil
critter_here = nil
check_room_acceptable = nil
get_task = nil
checking_rank_status = nil
batter_barriers_stuff = nil
current_batter_barriers_task = nil
current_batter_barriers_material = nil
checking_status = nil
help_screen = nil
current_stamina = nil
check_popped_muscles = nil
main_task = nil
this_room = nil
current_number_of_ranks = nil
max_number_of_ranks = nil
check_in = nil
needed_silvers = nil
batter_critter_boxes = nil
knows_batter_current_skill = nil
warrior_tricks_masters_and_audience = nil
trick_to_perform = nil
current_trick = nil
people_here = nil
rake_leaves = nil
put_tools_away = nil
get_drink_for_guzzle_trick = nil
buy_sheath = nil
next_guild_room_number = nil
go_to_next_guild = nil
$first_guild = nil
next_guild_town_name = nil
first_guild_town_name = nil
go_back_to_first_guild = nil
check_leaf_bag_status = nil
leaf_bag_full = nil
empty_leaves_in_bin = nil
wait_before_doing_more_guild_tasks = nil
tricks_weapon = nil
first_skill_rank = nil
get_in_offensive_stance = nil
guild_stance = nil
stand_up = nil
critter_task_target = nil
get_weapon_and_off_hand = nil
stance_defensive = nil
practice_disarm_weapon = nil
practice_disarm_weapon_type = nil
practice_disarm_weapon_id = nil
masters_task = nil
message_string = nil
go_to_bank = nil
wait_rt = nil
attack_partner_tasks = nil
current_disarm_others_weapon = nil
done_checking_weapons = nil
check_for_weapons = nil
go_to_partner_room = nil
my_partner = nil
help_with_partner_tasks_start = nil
help_with_partner_tasks_be_attacked = nil
stow_right = nil
stow_left = nil
stance_offensive = nil
be_attacked_by_partner_tasks = nil
help_with_partner_tasks_attack_partner = nil
my_partner_task = nil
my_partner_task_me_or_you = nil
do_not_do_next_parter_task = nil
disarm_wheel = nil
wait_for_partner_confirmation = nil
partner_question_to_ask = nil
check_gld_stance = nil
needed_gld_stance = nil
tackle_dummies = nil
do_guild_chores = nil
spit_status = nil
check_spit_status = nil
end_modified_roll = nil
warcry_to_perform = nil
start_time = nil
trick_location = nil
target_room_list = nil
cheapest_weapon_to_buy = nil
buy_needed_weapon = nil
current_checked_weapon_type = nil
weapon_type_to_check = nil
current_be_disarmed_weapon = nil
weapon_field_to_check = nil
wait_for_my_partner = nil
stow_all = nil
temp_weapon = nil
berserk_tasks = nil
need_to_rest_vocal_cords = nil
$food_item = nil
$food_room_number = nil
$guzzle_room_number = nil
$drink_item = nil
trade_in_task = nil
check_in_with_guild_master = nil
current_number_of_ranks_for_current_skill = nil


current_lowest_cost = 100000
warcry_count = 0
number = 0

$cheapest_blunt_weapon = nil unless $cheapest_blunt_weapon
$cheapest_brawling_weapon = nil unless $cheapest_brawling_weapon
$cheapest_edged_weapon = nil unless $cheapest_edged_weapon
$cheapest_polearm_weapon = nil unless $cheapest_polearm_weapon
$cheapest_twohanded_weapon = nil unless $cheapest_twohanded_weapon
$cheapest_large_weapon = nil unless $cheapest_large_weapon
$checked_weapon_room = nil unless $checked_weapon_room

$current_blunt_be_disarmed_weapon = nil unless $current_blunt_be_disarmed_weapon
$current_brawling_be_disarmed_weapon = nil unless $current_brawling_be_disarmed_weapon
$current_edged_be_disarmed_weapon = nil unless $current_edged_be_disarmed_weapon
$current_polearm_be_disarmed_weapon = nil unless $current_polearm_be_disarmed_weapon
$current_twohanded_be_disarmed_weapon = nil unless $current_twohanded_be_disarmed_weapon

wander_rooms = Array.new
rooms_not_to_do = Array.new
order_number = Array.new
silver_cost = Array.new

order_name = Hash.new

gld_menu_stuff_to_ignore = /You are Guild Master of the Warrior Guild\.|You are a member of the Warrior Guild\.|You are current with your dues and must check in again sometime in the next \d+ days\.|You currently have \d+ task trading vouchers\.|You currently have no ranks in any guild skills\.|You need \d+ training points? to earn your next rank\.|The Training Administrator told you to go visit the skilled masters\.|You have \d+ repetitions? remaining to complete this task\.|You have \d+ repetitions? remaining for this task\.|You have no ranks in the (Batter Barriers|Berserk|Disarm Weapon|Tackle|War Cries|Warrior Tricks) skill\.|You have no repetitions remaining for this task\.|You have earned enough training points for your next rank\.|You have \d+ ranks? in the (Batter Barriers|Berserk|Disarm Weapon|Tackle|War Cries|Warrior Tricks) skill\.|You are not currently training in this skill\.|The Training Administrator told you to visit the skilled masters\.|You will need to do \d+ hit points of damage for each repetition\.|You have \d+ repetitions? remaining for this task\.|The Training Administrator told you to go out and practice Berserk against creatures\.|The Training Administrator told you to go practice in the saunas\.|The Training Administrator told you to go practice in the ice tubs\.|You currently have ([a-zA-Z]+|\d+) ranks? out of a possible \d+ for your training\.|The Training Administrator told you to break up some old boards from the wood shed\.|You will need to do \d+ hit points of damage for each repetition\.|The Training Administrator told you to break up some slabs of ice\.|The Training Administrator told you to practice breaking (stuns|webs|paralysis) in the Dark Chamber\.|The Training Administrator told you to break up some branches from the wood shed\.|The Training Administrator told you to go break down some old crates to earn the guild some money\.|The Training Administrator told you to go break down some sheet metal to earn the guild some money\.|The Training Administrator told you to bash some cheap practice boxes\.|You are (.*) months? behind with your dues\.|You have received .* reminders? about your past dues\.|You are a Master of .*\.|The Training Administrator told you to practice on the wooden stage door in the guild with a weapon\.|The Training Administrator told you to practice on the wooden stage door in the guild with your shoulder\.|The Training Administrator told you to bash open some boxes from creatures\.|The Training Administrator told you to bash open some metal boxes from creatures\.|The Training Administrator told you to bash open some really tough metal boxes from creatures\.|You are current with your dues and must check in again sometime in the next \d+ hours?\.|You are current with your dues and must check in again sometime in the next \d+ minutes?\.|The Training Administrator told you to practice on the metal stage door in the guild\.|The Training Administrator told you to practice .* for an audience\.|The Training Administrator told you to rake the guild yard\.|The Training Administrator told you to scrub the floors\.|The Training Administrator told you to prune some shrubbery\.|The Training Administrator told you to work with the skilled masters\.|The Training Administrator told you to practice tackling creatures\.|The Training Administrator told you to take a practice (blunt|brawling|edged|polearm|twohanded).*and visit the skilled masters\.|The Training Administrator told you to get a lesson from the skille?d? masters on disarming (blunt|brawling|edged|polearm|twohanded).*\.|The Training Administrator told you to practice disarming a partner with an? (blunt|brawling|edged|polearm|twohanded).*\.|The Training Administrator told you to let a partner disarm an? (blunt|brawling|edged|polearm|twohanded).*from you\.|The Training Administrator told you to use a practice (blunt|brawling|edged|polearm|twohanded).*with the Wheel\.|The Training Administrator told you to practice disarming creatures with an? (blunt|brawling|edged|polearm|twohanded).*\.|The Training Administrator told you to practice tackling a partner\.|The Training Administrator told you to practice defending against tackles\.|The Training Administrator told you to work with the tackling dummies\.|The Training Administrator told you to polish the armor around the guild\.|The Training Administrator told you to practice Spit on a suitable creature\.|The Training Administrator told you to practice Feint on a suitable creature\.|The Training Administrator told you to get a skilled master to teach some war cry techniques\.|The Training Administrator told you to get a partner to teach some war cry techniques\.|The Training Administrator told you to scrub the guild floors\.|The Training Administrator told you to spiff up the shrubbery\.|The Training Administrator told you to polish the armor in the guild\.|The Training Administrator told you to practice Spin Attack on a suitable creature\.|The Training Administrator told you to practice (.*) on creatures\.|You have not been assigned a current task for this skill\.|Neither you nor any training partners will earn experience for tasks completed until you complete one task in any skill\.|The Training Administrator told you to practice Haircut on a suitable creature\.|The Training Administrator told you to practice Kick\-n\-Sheath for an audience\.|The Training Administrator told you to have a trainer show you how to open boxes with your bare hands\.|The Training Administrator told you to break open some practice boxes with your head\./


setup = proc{
	Gtk.queue {
		$BBB_WINDOW = Gtk::Window.new
		$BBB_WINDOW.title = "warrior"
		$BBB_WINDOW.set_border_width(10)
		$BBB_BOX = Gtk::VBox.new(false)
		$BBB_BOX.set_border_width(5)

		$BBB_VERTICAL_BOX1 = Gtk::VBox.new(false, 0)
		$BBB_VERTICAL_BOX2 = Gtk::VBox.new(false, 0)
		$BBB_VERTICAL_BOX3 = Gtk::VBox.new(false, 0)
		$BBB_VERTICAL_BOX4 = Gtk::VBox.new(false, 0)
		$BBB_VERTICAL_BOX5 = Gtk::VBox.new(false, 0)

		$BBB_WINDOW.add($BBB_BOX)
		$BBB_NOTEBOOK = Gtk::Notebook.new
		$BBB_NOTEBOOK.set_show_border(true)
		$BBB_BOX.add($BBB_NOTEBOOK)
		$BBB_NOTEBOOK.append_page($BBB_VERTICAL_BOX1, Gtk::Label.new('General'))
		$BBB_NOTEBOOK.append_page($BBB_VERTICAL_BOX2, Gtk::Label.new('Critter Info'))
		$BBB_NOTEBOOK.append_page($BBB_VERTICAL_BOX3, Gtk::Label.new('Batter Barriers'))
		$BBB_NOTEBOOK.append_page($BBB_VERTICAL_BOX4, Gtk::Label.new('Tackle'))
		$BBB_NOTEBOOK.append_page($BBB_VERTICAL_BOX5, Gtk::Label.new('Trading Tasks'))
		$BBB_ENTRY = Hash.new 
		$BBB_TABLE_SIZE = Hash.new
	}

	Gtk.queue {
		$BBB_TABLE1 = Gtk::Table.new(6, 3, false)
		$BBB_TABLE1.row_spacings=3
		$BBB_TABLE1.column_spacings=3
		$BBB_VERTICAL_BOX1.pack_start($BBB_TABLE1, false, false, 0)

		$BBB_TABLE2 = Gtk::Table.new(6, 3, false)
		$BBB_TABLE2.row_spacings=3
		$BBB_TABLE2.column_spacings=3
		$BBB_VERTICAL_BOX2.pack_start($BBB_TABLE2, false, false, 0)

		$BBB_TABLE3 = Gtk::Table.new(6, 3, false)
		$BBB_TABLE3.row_spacings=3
		$BBB_TABLE3.column_spacings=3
		$BBB_VERTICAL_BOX3.pack_start($BBB_TABLE3, false, false, 0)

		$BBB_TABLE4 = Gtk::Table.new(6, 3, false)
		$BBB_TABLE4.row_spacings=3
		$BBB_TABLE4.column_spacings=3
		$BBB_VERTICAL_BOX4.pack_start($BBB_TABLE4, false, false, 0)

		$BBB_TABLE5 = Gtk::Table.new(6, 3, false)
		$BBB_TABLE5.row_spacings=3
		$BBB_TABLE5.column_spacings=3
		$BBB_VERTICAL_BOX5.pack_start($BBB_TABLE5, false, false, 0)
	}

	def self.add_label_entry(table, label, variable)
		size = $BBB_TABLE_SIZE[table] || 0

		label = Gtk::Label.new(label)
		align = Gtk::Alignment.new 1, 0, 0, 0
		align.set_padding(4, 0, 3, 4)
		align.add(label)
		table.attach(align, 0, 1, size, size + 1)

		entry = Gtk::Entry.new
		entry.text = UserVars.warrior[variable].to_s
		entry.set_width_request(157)
		table.attach(entry, 1, 2, size, size + 1)

		$BBB_ENTRY[variable] = entry
		$BBB_TABLE_SIZE[table] += 1
	end

	Gtk.queue {
		$BBB_ENTRY = Hash.new
		add_label_entry($BBB_TABLE1, "Get Promotions From Partner:", 'get_ranks_from_partner')
		add_label_entry($BBB_TABLE1, "Messages:", 'receive_messaging')
		add_label_entry($BBB_TABLE1, "Lnet message partner:", 'lnet_message_partner')
		add_label_entry($BBB_TABLE1, "Auto check in:", 'auto_check_in')
		add_label_entry($BBB_TABLE1, "Do work in other guilds:", 'do_work_in_other_guilds')
		add_label_entry($BBB_TABLE1, "Weapon:", 'weapon')
		add_label_entry($BBB_TABLE1, "Offhand:", 'offhand')
		add_label_entry($BBB_TABLE1, "Main Disarm Weapon:", 'main_disarm_weapon')
		add_label_entry($BBB_TABLE1, "Use Boosts:", 'use_boosts')
		add_label_entry($BBB_TABLE2, "Critter rooms:", 'critter_task_rooms')
		add_label_entry($BBB_TABLE2, "Critter names:", 'critter_task_names')
		add_label_entry($BBB_TABLE2, "Resting room:", 'critter_task_resting_room')
		add_label_entry($BBB_TABLE2, "Pre rest command:", 'critter_task_pre_rest_command')
		add_label_entry($BBB_TABLE3, "Batter Barriers Weapon:", 'batter_barriers_weapon')
		add_label_entry($BBB_TABLE3, "Locker room:", 'locker_room_number')
		add_label_entry($BBB_TABLE3, "Container to stow weapon:", 'container_to_stow_weapon')
		add_label_entry($BBB_TABLE3, "Critter boxes room:", 'critter_boxes_room')
		add_label_entry($BBB_TABLE3, "Low health script:", 'low_health_script')
		add_label_entry($BBB_TABLE3, "Haste script:", 'haste_script')
		add_label_entry($BBB_TABLE4, "Critter Stance:", 'critter_tackle_stance')
		add_label_entry($BBB_TABLE4, "Critter Stow Weapon:", 'critter_tackle_stow_weapon')
		add_label_entry($BBB_TABLE4, "Critter Stow Offhand:", 'critter_tackle_stow_off_hand')
		add_label_entry($BBB_TABLE5, "Disarm Partner Tasks:", 'turn_in_disarm_partner_tasks')
		add_label_entry($BBB_TABLE5, "Tackle Partner Tasks:", 'turn_in_tackle_partner_tasks')
		add_label_entry($BBB_TABLE5, "Warcry Partner Tasks:", 'turn_in_warcry_partner_tasks')
		add_label_entry($BBB_TABLE5, "Disarm Critter Tasks:", 'turn_in_disarm_critter_tasks')
		add_label_entry($BBB_TABLE5, "Tackle Critter Tasks:", 'turn_in_tackle_criter_tasks')
		add_label_entry($BBB_TABLE5, "Warcry Critter Tasks:", 'turn_in_warcry_critter_tasks')
		add_label_entry($BBB_TABLE5, "Berserk Critter Tasks:", 'turn_in_berserk_critter_tasks')
		add_label_entry($BBB_TABLE5, "Warrior Tricks Critter Tasks:", 'turn_in_tricks_critter_tasks')
		add_label_entry($BBB_TABLE5, "Batter Barriers Critter Boxes Tasks:", 'turn_in_batter_boxes_tasks')
	}

	def self.add_checkbox(table, x_pos, label, variable, default = false)
		size = $BBB_TABLE_SIZE[table] || 0
		checkbox = Gtk::CheckButton.new label
		value = UserVars.warrior[variable].nil? ? default : UserVars.warrior[variable]
		checkbox.set_active(value)
		table.attach(checkbox, x_pos, x_pos + 1, size, size + 1)
		$BBB_ENTRY[variable] = checkbox
		$BBB_TABLE_SIZE[table] += 1 if x_pos == 1
	end
        
	Gtk.queue {
		$BBB_WINDOW.signal_connect("delete_event") {
			$BBB_SETUP_COMPLETED = true
		}
	}
        
	Gtk.queue {
		$BBB_TOOLTIPS = Gtk::Tooltips.new
		$BBB_TOOLTIPS.enable

		label = Gtk::Label.new
		label.set_markup("Enter <b>nil</b> for any setting you don't want to use.\n<b>Get Promotions From Partner:</b> Enter <b>yes</b> to get promotions from your partner, otherwise you will get promotions from the NPC guild master.\n<b>Messages:</b>  Enter <b>yes</b> if you wish to receive feedback about what the script is currently doing.\n<b>Lnet message partner:</b> Enter <b>yes</b> to Lnet message your partner when their help is required.\nEntering <b>yes</b> for lnet messages requires you to trust this script.\n<b>Auto check in:</b>  Enter <b>yes</b> for script to automatically check in when guild fees are due.\n<b>Do work in other guilds:</b>  Enter <b>yes</b> to travel to nearby guilds if necessary for certain tasks. This includes audience reps.\nCurrently only works if you're doing tasks out of Icemule, Landing or Solhaven guilds.\n<b>Weapon:</b>  Name of your weapon. This is used in several guild reps.\n<b>Offhand:</b>  Name of your offhand weapon/shield.\n<b>Main Disarm Weapon:</b> Weapon to be used for disarm partner tasks and critter disarm tasks.\n<b>Warning:</b> This weapon will be knocked to the ground during certain disarm partner reps, do not use a weapon you don't want to risk losing.\n<b>Use Boosts:</b> Enter 'yes' to use Guild Profession Boost (if needed) before finishing task.")
		align = Gtk::Alignment.new(1, 0, 0, 0)
		align.set_padding(50, 0, 0, 40)
		align.add(label)
		$BBB_TABLE1.attach(align, 1, 2, 9, 10)

		label = Gtk::Label.new
		label.set_markup("Enter <b>exit</b> in <b>Critter rooms</b> field to exit script on critter tasks so you can do them manually.\n<b>Critter rooms:</b>  List all rooms of area you want to look for critters in; example 1,2,3\nNo spaces after commas\n<b>Critter names:</b>  Name of critters to look for, example: critterA|critterB\n<b>Resting room:</b>  Room number to rest in when out of stamina.\n<b>Pre rest commands:</b>  Command to enter after arriving at Resting room number.")
		align = Gtk::Alignment.new(1, 0, 0, 0)
		align.set_padding(50, 0, 0, 40)
		align.add(label)
		$BBB_TABLE2.attach(align, 1, 2, 8, 9)

		label = Gtk::Label.new
		label.set_markup("Enter <b>nil</b> for any setting you don't want to use.\n<b>Batter Barriers Weapon:</b>  Enter name of weapon you use for Batter Barriers tasks.\n<b>Locker room:</b>  Room number where curtain or opening to locker is found.\nWhen doing Batter Barriers tasks the script will check locker for battering weapon if not found on character.\n<b>Container to stow weapon:</b>  Name of container to stow weapon for tasks where it's not needed.\n<b>Critter boxes room:</b> Room number of room where you have critter boxes waiting for you to batter.\nIf above setting is used your character won't pick up boxes when finished with critter batter box tasks.\n<b>Low health script:</b>  Name of script to run while low on health.\nExample you could create a script that eats acantha leaf until full health.\n<b>Haste script:</b>  Similar to above; name of script to run when haste not active on character.\nThe script could run you to a wizard who casts haste on you.")
		align = Gtk::Alignment.new(1, 0, 0, 0)
		align.set_padding(50, 0, 0, 40)
		align.add(label)
		$BBB_TABLE3.attach(align, 1, 2, 8, 9)

		label = Gtk::Label.new
		label.set_markup("Enter <b>nil</b> for any setting you don't want to use.\n<b>Critter Stow Weapon:</b> Enter <b>yes</b> to stow your weapon when tackling critters. Having a weapon in hand gives a -10 penalty.\n<b>Critter Stow Offhand:</b> Enter <b>yes</b> to stow your offhand when tackling critters. Having something in offhand gives a -10 penalty.\n<b>Critter Stance:</b> Enter stance you want to be in when tackling critters. Offensive stance gives highest bonus to successfully tackling.\nEnter one of the following for stance:  Offensive, Advance, Forward, Neutral, Guarded, Defensive\n<b>Note:</b> Script will always put you in defensive stance and grab your weapon and offhand when looking for a critter.")
		align = Gtk::Alignment.new(1, 0, 0, 0)
		align.set_padding(50, 0, 0, 40)
		align.add(label)
		$BBB_TABLE4.attach(align, 1, 2, 8, 9)

		label = Gtk::Label.new
		label.set_markup("Enter <b>yes</b> for any task you wish to automatically trade in.")
		align = Gtk::Alignment.new(1, 0, 0, 0)
		align.set_padding(50, 0, 0, 40)
		align.add(label)
		$BBB_TABLE5.attach(align, 1, 2, 9, 10)

		$BBB_WINDOW.show_all
	}
        
	$BBB_SETUP_COMPLETED = false
	until($BBB_SETUP_COMPLETED)
		sleep 1
	end
       
	UserVars.warrior ||= Hash.new
	$BBB_ENTRY.keys.each { |key|
		if( $BBB_ENTRY[key].class.to_s =~ /CheckButton/ )
			value = $BBB_ENTRY[key].active?
			UserVars.warrior[key] = $BBB_ENTRY[key].active?
		else
			if(key == 'wounded_eval')
				UserVars.warrior[key] = $BBB_ENTRY[key].text
			else
				UserVars.warrior[key] = $BBB_ENTRY[key].text.strip.downcase
			end
		end
	}
	UserVars.save()
        
	Gtk.queue {
		$BBB_WINDOW.destroy
	}
}

help_screen = proc{
	3.times { respond "----------------------------------------------------------------------------------------------------" }
	respond "Version: #{version}"
	respond "Solo tasks information:"
	respond "Type ;warrior bat or ;warrior batter to work on Batter Barriers tasks."
	respond "Type ;warrior ber or ;warrior berserk to work on Berserk tasks."
	respond "Type ;warrior dis or ;warrior disarm to work on Disarm Weapon tasks."
	respond "Type ;warrior tac or ;warrior tackle to work on Tackle tasks."
	respond "Type ;warrior cri or ;warrior cries to work on War Cries tasks."
	respond "Type ;warrior tri or ;warrior tricks to work on Warrior Tricks tasks."
	respond " "
	respond "Partner task information:"
	respond "Type ;warrior <any solo command> <partner name> to do a partner task with a partner who is in the room with you."
	respond "Type ;warrior <any solo command> <partner name> <room number> to first run to the specified room number (where your partner should be) before doing a partner task."
	respond "Using ;warrior <command> <partner name> <room number> will continue attempting to do solo tasks and partner tasks until you kill script."
	respond " "
	respond "To help others with their tasks:"
	respond "Type ;warrior partner to set your character up to help anyone with their partner reps."
	respond "Type ;warrior partner name to set your character up to help only the specified person with their partner reps."
	respond "Type ;warrior setup to enter the setup screen."
	respond "Type ;warrior help to display this help screen."
	respond " "
	respond "Some Disarm and Tricks tasks will require you to have silvers in the bank in order to finish these tasks."
	respond "Good idea to have at least 10k in the bank when using this script for those skills."
	3.times { respond "----------------------------------------------------------------------------------------------------" }
}

current_skill_start = proc{
	first_skill_rank = nil
	if script.vars[1] =~ /bat/
		current_skill_name = "Batter Barriers"
	elsif script.vars[1] =~ /ber/
		current_skill_name = "Berserk"
	elsif script.vars[1] =~ /dis/
		current_skill_name = "Disarm Weapon"
	elsif script.vars[1] =~ /tac/
		current_skill_name = "Tackle"
	elsif script.vars[1] =~ /cri/
		current_skill_name = "War Cries"
	elsif script.vars[1] =~ /tri/
		current_skill_name = "Warrior Tricks"
	end
	check_task.call
}

check_in = proc{
	message_string = "Paying guild dues."
	display_message.call
	go_to_bank = true
	go_to.call
	fput "withdraw #{needed_silvers}"
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild guildmaster') }
	go_to.call
	fput "ask #{person} about checkin"
	current_skill_start.call	
}	

get_task = proc{
	checking_rank_status = nil
	message_string = "Getting task in: #{current_skill_name}."
	display_message.call
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild administrator') }
	go_to.call
	if current_skill_name == "War Cries"
		fput "ask #{person} about training warcries"
	else
		fput "ask #{person} about training #{current_skill_name}"
	end
	current_skill_start.call
}

turn_in_task = proc{
	fput "drop my box" if GameObj.right_hand.name =~ /cheap wooden box/
	message_string = "Turning in task."
	display_message.call
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild administrator') }
	go_to.call
	if UserVars.warrior["use_boosts"] =~ /yes/i
		if CharSettings['boost_time'] == nil || Time.now > CharSettings['boost_time']
			waitrt?
			fput "boost guild profession"
			while line = get
				if line =~ /\[You have activated a Profession Guild Boost\.  You will earn doubled Training Point awards from Profession Guild tasks for the next (\d+) minutes\.\]/
					CharSettings['boost_time'] = Time.now + ($1.to_i * 60)
					break
				elsif line =~ /You do not have any Guild Boosts to redeem\.|It is currently a Guild Night\, when training point awards are already doubled\./
					break
				end
			end
		end
	end
	if current_skill_name == "War Cries"
		2.times { fput "ask #{person} about training warcries" }
	else
		2.times { fput "ask #{person} about training #{current_skill_name}" }
	end
	current_skill_start.call
}

trade_in_task = proc{
	message_string = "Trading in #{current_skill_name} task."
	display_message.call
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild administrator') }
	go_to.call
	if current_skill_name == "War Cries"
		fput "ask #{person} about trading warcries" 
	else
		fput "ask #{person} about trading #{current_skill_name}"
	end
	current_skill_start.call
}

display_message = proc{
	if UserVars.warrior["receive_messaging"] == "yes"
		message = ["#{message_string}"]
		count = 0
		message.each {|s| count += s.length}
		str = ""
		(1..count).each {|i| str += "-" }
		3.times { respond "#{str}" }
		respond "#{message_string}"
		3.times { respond "#{str}" }
	end
}

wait_for_stamina = proc{
	if checkstamina < 20
		message_string = "Waiting for stamina."
		display_message.call
		wait_until { checkstamina > 20 }
	end
}

check_popped_muscles = proc{
	if Spell[9699].active?
		if main_task =~ /Critters/
			this_room = Room.current.id
			if UserVars.warrior["critter_task_resting_room"] != "nil" && UserVars.warrior["critter_task_resting_room"] != nil && UserVars.warrior["critter_task_resting_room"] != ""
				message_string = "Muscles are popped; heading to resting spot."
				display_message.call
				kill_script "go2" if running? "go2"
				wait_until { !running? "go2" }
				start_script 'go2', [ UserVars.warrior["critter_task_resting_room"] ]
				wait_while { running?('go2') }
				if UserVars.warrior["critter_task_pre_rest_command"] != "nil" && UserVars.warrior["critter_task_pre_rest_command"] != nil && UserVars.warrior["critter_task_pre_rest_command"] != ""
					fput "#{UserVars.warrior["critter_task_pre_rest_command"]}"
				end
			end
		end
		message_string = "Waiting for popped muscles to go away."
		display_message.call
		wait_until { !Spell[9699].active? }
		if main_task =~ /Critters/
			kill_script "go2" if running? "go2"
			wait_until { !running? "go2" }
			start_script 'go2', [ this_room ]
			wait_while { running?('go2') }
			current_task = "wander"
		end		
	end
}

go_to = proc{
	target_room = Room.current.find_nearest(target_room_list)
	stand_up.call
	move 'out' if checkpaths 'out'
	kill_script "go2" if running? "go2"
	wait_until { !running? "go2" }
	if go_to_bank
		start_script 'go2', [ 'bank', '--disable-confirm' ]
	else
		until Room.current.id == target_room
			if Room.current.id != target_room
				start_script 'go2', [ target_room.to_s ]
				wait_while{ running?('go2') }
			end
			sleep 0.1
		end
	end
	wait_while { running?('go2') }
	fput "depo all" if go_to_bank
	go_to_bank = nil
	person = GameObj.npcs.last
}

check_guild_status = proc{
	action = proc { |server_string|
		if server_string =~ /You have no guild affiliation\./
			current_task = "join guild"
			DownstreamHook.remove("#{script.name}_check_guild_status")
			nil
		elsif server_string =~ gld_menu_stuff_to_ignore
			nil
		elsif server_string =~ /^\s+$/
			nil
		elsif server_string =~ /Click .*GLD MENU.* for additional commands\./
			current_task = "none"
			DownstreamHook.remove("#{script.name}_check_guild_status")
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_guild_status", action)
		silence_me
		fput "gld"
		silence_me
		wait_until { current_task != nil }
		if current_task == "join guild"
			message_string = "Getting silvers to join the guild."
			display_message.call
			go_to_bank = true
			go_to.call
			fput "withdraw 10500 silvers"
			message_string = "Joining the guild."
			display_message.call
			stand_up.call
			move 'out' if checkpaths 'out'
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild guildmaster') }
			go_to.call
			fput "ask #{person} about membership"
			fput "gld accept"
		end
}

check_in_with_guild_master = proc{
	message_string = "Getting silvers to pays dues."
	display_message.call
	go_to_bank = true
	go_to.call
	fput "withdraw 10500 silvers"
	message_string = "Paying dues."
	display_message.call
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild guildmaster') }
	go_to.call
	fput "ask #{person} about checkin"
	fput "ask #{person} about checkin"
	fput "ask #{person} about checkin"
}

check_leaf_bag_status = proc{
	action = proc { |server_string|
		if server_string =~ /The .* is full of leaves\./
			leaf_bag_full = "yes"
			DownstreamHook.remove("#{script.name}_check_leaf_bag_status")
			nil
		elsif server_string =~ /The .* is empty\.|The .* has a bunch of leaves in it\.  It has room for more\./
			leaf_bag_full = "no"
			DownstreamHook.remove("#{script.name}_check_leaf_bag_status")
			nil
		elsif server_string =~ /I could not find what you were referring to\./
			DownstreamHook.remove("#{script.name}_check_leaf_bag_status")
			nil
		elsif server_string =~ /^\s+$/
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_leaf_bag_status", action)
		silence_me
		fput "look in my bag"
		silence_me
		wait_until { leaf_bag_full != nil }
}

check_critter_task_status = proc{
	action = proc { |server_string|
		if server_string =~ gld_menu_stuff_to_ignore
			nil
		elsif server_string =~ /Click .*GLD MENU.* for additional commands\./
			DownstreamHook.remove("#{script.name}_check_critter_task_status")
			nil
		elsif server_string =~ /^\s+$/
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_critter_task_status", action)
		silence_me
		fput "gld"
		silence_me
		while line = get
			if line =~ /You have no ranks in the #{current_skill_name} skill\.|You have \d+ ranks? in the #{current_skill_name} skill\./
				while line = get
					if (line =~ /The Training Administrator told you to go visit the skilled masters\.|The Training Administrator told you to go out and practice Berserk against creatures\.|The Training Administrator told you to go practice in the saunas\.|The Training Administrator told you to go practice in the ice tubs\.|The Training Administrator told you to practice breaking (stuns|webs|paralysis) in the Dark Chamber\./ && current_skill_name == "Berserk") || (line =~ /The Training Administrator told you to practice tackling creatures\./ && current_skill_name == "Tackle") || (line =~ /The Training Administrator told you to practice disarming creatures with an? (blunt|brawling|edged|polearm|twohanded).*\./ && current_skill_name == "Disarm Weapon") || (line =~ /The Training Administrator told you to practice Spit on a suitable creature\./ && current_skill_name == "Warrior Tricks") || (line =~ /The Training Administrator told you to practice Feint on a suitable creature\./ && current_skill_name == "Warrior Tricks") || (line =~ /The Training Administrator told you to practice Spin Attack on a suitable creature\./ && current_skill_name == "Warrior Tricks") || (line =~ /The Training Administrator told you to practice (.*) on creatures\./ && current_skill_name == "War Cries") || (line =~ /The Training Administrator told you to practice Haircut on a suitable creature\./ && current_skill_name == "Warrior Tricks")
						current_task = nil
						while line = get
							if line =~ /You have no repetitions remaining for this task\./
								current_task = "finished"
								break
							elsif line =~ /You have \d+ repetitions? remaining to complete this task\.|You have \d+ repetitions? remaining for this task\./
								current_task = "not finished"
								break
							end
						end
						break
					end
				end
			end
			if line =~ /Click GLD MENU for additional commands\./
				break
			end
		end
}

get_weapon_and_off_hand = proc{
	if checkright !~ /#{UserVars.warrior["weapon"]}/
		store_backsheath
		stow_all.call
		until checkright != nil
			wait_rt.call
			fput "get my #{UserVars.warrior["weapon"]}"
			sleep 0.1
		end
	end
	if UserVars.warrior["offhand"] != "nil" && UserVars.warrior["offhand"] != nil && UserVars.warrior["offhand"] != ""
		if checkleft !~ /#{UserVars.warrior["offhand"]}/
			stow_left.call
			until checkleft != nil
				wait_rt.call
				result = dothistimeout "get my #{UserVars.warrior["offhand"]}", 3, /You already have that\.|You remove/
				if result =~ /You remove/
					nil
				elsif result =~ /You already have that\./
					fput "remove my #{UserVars.warrior["offhand"]}"
				elsif result.nil?
					fput "remove my #{UserVars.warrior["offhand"]}"
				end
				sleep 0.1
			end
		end
	end
}

check_task = proc {
	action = proc { |server_string|
		if server_string =~ gld_menu_stuff_to_ignore
			nil
		elsif server_string =~ /^\s+$/
			nil
		elsif server_string =~ /Click .*GLD MENU.* for additional commands\./
			DownstreamHook.remove("#{script.name}_check_task")
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_task", action)
		silence_me
		fput "gld"
		silence_me
		current_task = nil
		while line = get
			if line =~ /#{current_skill_name}/
				knows_current_skill = true
			end
			if line =~ /You currently have no ranks in any guild skills\./
				current_task = "first rank"
			end
			if line =~ /You are (.*) months? behind with your dues\./ && UserVars.warrior["auto_check_in"] == "yes"
				if $1 == "one"
					needed_silvers = 3500
				elsif $1 == "two"
					needed_silvers = 7000
				elsif $1 == "three"
					needed_silvers = 10500
				end
				current_task = "check in"
			end
			if line =~ /You are a Master of #{current_skill_name}\./
				message_string = "You are already a master in #{current_skill_name}."
				display_message.call
				exit
			end
			if line =~ /You currently have (\d+) ranks? out of a possible (\d+) for your training\./
				current_number_of_ranks = $1
				max_number_of_ranks = $2
				if current_number_of_ranks == max_number_of_ranks
					message_string = "You have reached your current maximum number of ranks."
					display_message.call
					exit
				end
			end
			if line =~ /You have no ranks in the #{current_skill_name} skill\.|You have (\d+) ranks? in the #{current_skill_name} skill\./ && current_task != "check in"
				if line =~ /You have no ranks in the #{current_skill_name} skill\./
					first_skill_rank = true
				elsif line =~ /You have (\d+) ranks? in the #{current_skill_name} skill\./
					current_number_of_ranks_for_current_skill = $1.to_i
				end
				while line = get
					if line =~ /The Training Administrator told you to visit the skilled masters\.|The Training Administrator told you to go visit the skilled masters\.|The Training Administrator told you to go out and practice Berserk against creatures\.|The Training Administrator told you to go practice in the saunas\.|The Training Administrator told you to go practice in the ice tubs\.|The Training Administrator told you to practice breaking (stuns|webs|paralysis) in the Dark Chamber\.|The Training Administrator told you to break up some old boards from the wood shed\.|The Training Administrator told you to break up some slabs of ice\.|The Training Administrator told you to break up some branches from the wood shed\.|The Training Administrator told you to go break down some old crates to earn the guild some money\.|The Training Administrator told you to go break down some sheet metal to earn the guild some money\.|The Training Administrator told you to bash some cheap practice boxes\.|The Training Administrator told you to practice on the wooden stage door in the guild with a weapon\.|The Training Administrator told you to practice on the wooden stage door in the guild with your shoulder\.|The Training Administrator told you to bash open some boxes from creatures\.|The Training Administrator told you to bash open some metal boxes from creatures\.|The Training Administrator told you to bash open some really tough metal boxes from creatures\.|The Training Administrator told you to practice on the metal stage door in the guild\.|The Training Administrator told you to practice .* for an audience\.|The Training Administrator told you to rake the guild yard\.|The Training Administrator told you to scrub the floors\.|The Training Administrator told you to prune some shrubbery\.|The Training Administrator told you to work with the skilled masters\.|The Training Administrator told you to practice tackling creatures\.|The Training Administrator told you to take a practice (blunt|brawling|edged|polearm|twohanded).*and visit the skilled masters\.|The Training Administrator told you to get a lesson from the skille?d? masters on disarming (blunt|brawling|edged|polearm|twohanded).*\.|The Training Administrator told you to practice disarming a partner with an? (blunt|brawling|edged|polearm|twohanded).*\.|The Training Administrator told you to let a partner disarm an? (blunt|brawling|edged|polearm|twohanded).*from you\.|The Training Administrator told you to use a practice (blunt|brawling|edged|polearm|twohanded).*with the Wheel\.|The Training Administrator told you to practice disarming creatures with an? (blunt|brawling|edged|polearm|twohanded).*\.|The Training Administrator told you to practice tackling a partner\.|The Training Administrator told you to practice defending against tackles\.|The Training Administrator told you to work with the tackling dummies\.|The Training Administrator told you to polish the armor around the guild\.|The Training Administrator told you to practice Spit on a suitable creature\.|The Training Administrator told you to practice Feint on a suitable creature\.|The Training Administrator told you to get a skilled master to teach some war cry techniques\.|The Training Administrator told you to get a partner to teach some war cry techniques\.|Administrator told you to scrub the guild floors\.|The Training Administrator told you to spiff up the shrubbery\.|The Training Administrator told you to polish the armor in the guild\.|The Training Administrator told you to practice Spin Attack on a suitable creature\.|The Training Administrator told you to practice (.*) on creatures\.|The Training Administrator told you to practice Haircut on a suitable creature\.|The Training Administrator told you to practice Kick\-n\-Sheath for an audience\.|The Training Administrator told you to have a trainer show you how to open boxes with your bare hands\.|The Training Administrator told you to break open some practice boxes with your head\./
						if (line =~ /The Training Administrator told you to practice (.*) for an audience\./) || (line =~ /The Training Administrator told you to practice (Spit) on a suitable creature\./) || (line =~ /The Training Administrator told you to practice (Feint) on a suitable creature\./) || (line =~ /The Training Administrator told you to practice (Spin Attack) on a suitable creature\./) || (line =~ /The Training Administrator told you to practice (Haircut) on a suitable creature\./)
							current_trick = $1
							if current_trick =~ /Weapon Flip/
								trick_to_perform = "wflip"
							elsif current_trick =~ /Guzzle/
								trick_to_perform = "guzzle"
							elsif current_trick =~ /Twirl\-n\-Sheath/
								trick_to_perform = "tsheath"
							elsif current_trick =~ /Weapon Hop/
								trick_to_perform = "whop"
							elsif current_trick =~ /Spin/
								trick_to_perform = "spin"
							elsif current_trick =~ /Appraise/
								trick_to_perform = "appraise"
							elsif current_trick =~ /Balancing/
								trick_to_perform = "balance palm"
							elsif current_trick =~ /Spit/
								trick_to_perform = "spit"
							elsif current_trick =~ /Juggling/
								trick_to_perform = "juggle 2"
							elsif current_trick =~ /Feint/
								trick_to_perform = "feint"
							elsif current_trick =~ /Backflip/
								trick_to_perform = "backflip"
							elsif current_trick =~ /Polish/
								trick_to_perform = "polish"
							elsif current_trick =~ /Draw/
								trick_to_perform = "draw"
							elsif current_trick =~ /Stance Perfection/
								trick_to_perform = "sperf"
							elsif current_trick =~ /Initial/
								trick_to_perform = "initial"
							elsif current_trick =~ /Roll/
								trick_to_perform = "roll"
							elsif current_trick =~ /Toss\-n\-Slice/
								trick_to_perform = "tslice"
							elsif current_trick =~ /Sheath Catch/
								trick_to_perform = "catchs"
							elsif current_trick =~ /Haircut/
								trick_to_perform = "haircut"
							elsif current_trick =~ /Kick\-n\-Sheath/
								trick_to_perform = "ksheath"
							end
							if current_trick =~ /Spin Attack/
								trick_to_perform = "sattack"
							end
						end
					if (line =~ /The Training Administrator told you to practice (.*) on creatures\./)
						warcry_to_perform = $1
						if warcry_to_perform =~ /Bertrandt\'s Bellow/
							warcry_to_perform = "bellow"
						elsif warcry_to_perform =~ /Yertie\'s Yowlp/
							warcry_to_perform = "yowlp"
						elsif warcry_to_perform =~ /Gerrelle\'s Growl/
							warcry_to_perform = "growl"
						elsif warcry_to_perform =~ /Seanette\'s Shout/
							warcry_to_perform = "shout"
						elsif warcry_to_perform =~ /Carn\'s Cry/
							warcry_to_perform = "cry"
						elsif warcry_to_perform =~ /Horland\'s Holler/
							warcry_to_perform = "holler"
						end
					end
						if (line =~ /The Training Administrator told you to take a practice (blunt|brawling|edged|polearm|twohanded).*and visit the skilled masters\./) || (line =~ /The Training Administrator told you to get a lesson from the skille?d? masters on disarming (blunt|brawling|edged|polearm|twohanded).*\./) || (line =~ /The Training Administrator told you to practice disarming a partner with an? (blunt|brawling|edged|polearm|twohanded).*\./) || (line =~ /The Training Administrator told you to let a partner disarm an? (blunt|brawling|edged|polearm|twohanded).*from you\./) || (line =~ /The Training Administrator told you to use a practice (blunt|brawling|edged|polearm|twohanded).*with the Wheel\./) || (line =~ /The Training Administrator told you to practice disarming creatures with an? (blunt|brawling|edged|polearm|twohanded).*\./)
							practice_disarm_weapon_type = $1
							if (line =~ /The Training Administrator told you to take a practice (blunt|brawling|edged|polearm|twohanded).*and visit the skilled masters\./) || (line =~ /The Training Administrator told you to get a lesson from the skille?d? masters on disarming (blunt|brawling|edged|polearm|twohanded).*\./) || (line =~ /The Training Administrator told you to use a practice (blunt|brawling|edged|polearm|twohanded).*with the Wheel\./)
								if practice_disarm_weapon_type =~ /blunt/
									practice_disarm_weapon = "mace"
								elsif practice_disarm_weapon_type =~ /brawling/
									practice_disarm_weapon = "club"
								elsif practice_disarm_weapon_type =~ /edged/
									practice_disarm_weapon = "broadsword"
								elsif practice_disarm_weapon_type =~ /polearm/
									practice_disarm_weapon = "halberd"
								elsif practice_disarm_weapon_type =~ /twohanded/
									practice_disarm_weapon = "sword"
								end
							end
						end
						current_task = "Batter Barriers: Masters" if line =~ /The Training Administrator told you to visit the skilled masters\.|The Training Administrator told you to have a trainer show you how to open boxes with your bare hands\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Boards" if line =~ /The Training Administrator told you to break up some old boards from the wood shed\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Ice" if line =~ /The Training Administrator told you to break up some slabs of ice\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Branches" if line =~ /The Training Administrator told you to break up some branches from the wood shed\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Crates" if line =~ /The Training Administrator told you to go break down some old crates to earn the guild some money\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Sheet Metal" if line =~ /The Training Administrator told you to go break down some sheet metal to earn the guild some money\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Practice Boxes" if line =~ /The Training Administrator told you to bash some cheap practice boxes\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Practice Boxes With Head" if line =~ /The Training Administrator told you to break open some practice boxes with your head\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Wooden Stage Door With Weapon" if line =~ /The Training Administrator told you to practice on the wooden stage door in the guild with a weapon\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Metal Stage Door With Weapon" if line =~ /The Training Administrator told you to practice on the metal stage door in the guild\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Break Wooden Stage Door With Shoulder" if line =~ /The Training Administrator told you to practice on the wooden stage door in the guild with your shoulder\./ && current_skill_name == "Batter Barriers"
						current_task = "Batter Barriers: Bash Critter Boxes" if line =~ /The Training Administrator told you to bash open some boxes from creatures\.|The Training Administrator told you to bash open some metal boxes from creatures\.|The Training Administrator told you to bash open some really tough metal boxes from creatures\./ && current_skill_name == "Batter Barriers"
						current_task = "Berserk: Masters" if line =~ /The Training Administrator told you to go visit the skilled masters\./ && current_skill_name == "Berserk"
						current_task = "Berserk: Critters" if line =~ /The Training Administrator told you to go out and practice Berserk against creatures\./ && current_skill_name == "Berserk"
						current_task = "Berserk: Sauna" if line =~ /The Training Administrator told you to go practice in the saunas\./ && current_skill_name == "Berserk"
						current_task = "Berserk: Tub" if line =~ /The Training Administrator told you to go practice in the ice tubs\./ && current_skill_name == "Berserk"
						current_task = "Berserk: Dark Chamber" if line =~ /The Training Administrator told you to practice breaking (stuns|webs|paralysis) in the Dark Chamber\./ && current_skill_name == "Berserk"
						current_task = "Disarm Weapon: Masters (#{practice_disarm_weapon_type} weapon)" if line =~ /The Training Administrator told you to take a practice (blunt|brawling|edged|polearm|twohanded).*and visit the skilled masters\.|The Training Administrator told you to get a lesson from the skille?d? masters on disarming (blunt|brawling|edged|polearm|twohanded).*\./ && current_skill_name == "Disarm Weapon"
						current_task = "Disarm Weapon: Disarm Partner (#{practice_disarm_weapon_type} weapon)" if line =~ /The Training Administrator told you to practice disarming a partner with an? (blunt|brawling|edged|polearm|twohanded).*\./ && current_skill_name == "Disarm Weapon"
						current_task = "Disarm Weapon: Be Disarmed by Partner (#{practice_disarm_weapon_type} weapon)" if line =~ /The Training Administrator told you to let a partner disarm an? (blunt|brawling|edged|polearm|twohanded).*from you\./ && current_skill_name == "Disarm Weapon"
						current_task = "Disarm Weapon: Disarm Wheel (#{practice_disarm_weapon_type} weapon)" if line =~ /The Training Administrator told you to use a practice (blunt|brawling|edged|polearm|twohanded).*with the Wheel\./ && current_skill_name == "Disarm Weapon"
						current_task = "Disarm Weapon: Disarm Critters (#{practice_disarm_weapon_type} weapon)" if line =~ /The Training Administrator told you to practice disarming creatures with an? (blunt|brawling|edged|polearm|twohanded).*\./ && current_skill_name == "Disarm Weapon"
						current_task = "Tackle: Masters" if line =~ /The Training Administrator told you to work with the skilled masters\./ && current_skill_name == "Tackle"
						current_task = "Tackle: Critters" if line =~ /The Training Administrator told you to practice tackling creatures\./ && current_skill_name == "Tackle"
						current_task = "Tackle: Tackle Partner" if line =~ /The Training Administrator told you to practice tackling a partner\./ && current_skill_name == "Tackle"
						current_task = "Tackle: Be Tackled By Partner" if line =~ /The Training Administrator told you to practice defending against tackles\./ && current_skill_name == "Tackle"
						current_task = "Tackle: Tackle Dummies" if line =~ /The Training Administrator told you to work with the tackling dummies\./ && current_skill_name == "Tackle"
						current_task = "War Cries: Masters" if line =~ /The Training Administrator told you to get a skilled master to teach some war cry techniques\./ && current_skill_name == "War Cries"
						current_task = "War Cries: Learn War Cries" if line =~ /The Training Administrator told you to get a partner to teach some war cry techniques\./ && current_skill_name == "War Cries"
						current_task = "War Cries: Scrub Floors" if line =~ /Administrator told you to scrub the guild floors\./ && current_skill_name == "War Cries"
						current_task = "War Cries: Rake Leaves" if line =~ /The Training Administrator told you to rake the guild yard\./ && current_skill_name == "War Cries"
						current_task = "War Cries: Prune Shrubbery" if line =~ /The Training Administrator told you to spiff up the shrubbery\./ && current_skill_name == "War Cries"
						current_task = "War Cries: Polish Armor" if line =~ /The Training Administrator told you to polish the armor in the guild\./ && current_skill_name == "War Cries"
						current_task = "War Cries: Critters" if line =~ /The Training Administrator told you to practice (.*) on creatures\./ && current_skill_name == "War Cries"
						current_task = "Warrior Tricks: Masters" if line =~ /The Training Administrator told you to go visit the skilled masters\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: #{current_trick} Audience" if line =~ /The Training Administrator told you to practice .* for an audience\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Rake Leaves" if line =~ /The Training Administrator told you to rake the guild yard\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Scrub Floors" if line =~ /The Training Administrator told you to scrub the floors\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Prune Shrubbery" if line =~ /The Training Administrator told you to prune some shrubbery\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Polish Armor" if line =~ /The Training Administrator told you to polish the armor around the guild\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Spit on Critters" if line =~ /The Training Administrator told you to practice Spit on a suitable creature\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Haircut on Critters" if line =~ /The Training Administrator told you to practice Haircut on a suitable creature\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Feint Critters" if line =~ /The Training Administrator told you to practice Feint on a suitable creature\./ && current_skill_name == "Warrior Tricks"
						current_task = "Warrior Tricks: Spin Attack Critters" if line =~ /The Training Administrator told you to practice Spin Attack on a suitable creature\./ && current_skill_name == "Warrior Tricks"
						main_task = current_task
						while line = get
							if line =~ /You have no repetitions remaining for this task\./
								current_task = "finished"
								break
							elsif line =~ /You have \d+ repetitions? remaining to complete this task\.|You have \d+ repetitions? remaining for this task\./
								break
							end
						end
						break
					elsif line =~ /You have earned enough training points for your next rank\./
						current_task = "get rank"
						break				
					elsif line =~ /You are not currently training in this skill\.|You have not been assigned a current task for this skill\./
						current_task = "get task"
						break
					end
				end
			end
			if line =~ /Click GLD MENU for additional commands\./
				if knows_current_skill == nil
					current_task = "first rank"
				end
				break
			end
		end
		wait_until {current_task != nil }
		if checking_status
			nil
		else			
			if current_task == "first rank"
				message_string = "Getting #{current_skill_name} task."
				display_message.call
				stand_up.call
				move 'out' if checkpaths 'out'
				target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild administrator') }
				go_to.call
				if current_skill_name == "War Cries"
					fput "ask #{person} about training warcries"
				else
					fput "ask #{person} about training #{current_skill_name}"
				end
				current_task = nil
				check_task.call
			elsif current_task == "check in"
				check_in.call
			elsif current_task =~ /Berserk\: Masters|Berserk\: Critters|Berserk\: Sauna|Berserk\: Tub|Berserk\: Dark Chamber|Batter Barriers\: Masters|Batter Barriers\: Break Boards|Batter Barriers\: Break Ice|Batter Barriers\: Break Branches|Batter Barriers\: Break Crates|Batter Barriers\: Break Sheet Metal|Batter Barriers\: Break Practice Boxes|Batter Barriers\: Break Wooden Stage Door With Weapon|Batter Barriers\: Break Wooden Stage Door With Shoulder|Batter Barriers\: Bash Critter Boxes|Batter Barriers\: Break Metal Stage Door With Weapon|Warrior Tricks\: Masters|Warrior Tricks\: #{current_trick} Audience|Warrior Tricks\: Rake Leaves|Warrior Tricks\: Scrub Floors|Warrior Tricks\: Prune Shrubbery|Tackle\: Masters|Tackle\: Critters|Disarm Weapon\: Masters \(#{practice_disarm_weapon_type} weapon\)|Disarm Weapon\: Disarm Partner \(#{practice_disarm_weapon_type} weapon\)|Disarm Weapon\: Be Disarmed by Partner \(#{practice_disarm_weapon_type} weapon\)|Disarm Weapon\: Disarm Wheel \(#{practice_disarm_weapon_type} weapon\)|Disarm Weapon: Disarm Critters \(#{practice_disarm_weapon_type} weapon\)|Tackle\: Tackle Partner|Tackle\: Be Tackled By Partner|Tackle\: Tackle Dummies|Warrior Tricks\: Polish Armor|Warrior Tricks\: Spit on Critters|Warrior Tricks\: Feint Critters|War Cries\: Masters|War Cries\: Learn War Cries|War Cries\: Scrub Floors|War Cries\: Rake Leaves|War Cries\: Prune Shrubbery|War Cries\: Polish Armor|Warrior Tricks\: Spin Attack Critters|War Cries\: Critters|Warrior Tricks\: Haircut on Critters|Warrior Tricks\: Kick\-n\-Sheath/
				message_string = "Doing task - #{current_task}"
				display_message.call
				##########Batter Barriers Tasks##########
				if current_task =~ /Batter Barriers\: Break Boards|Batter Barriers\: Break Ice|Batter Barriers: Break Branches|Batter Barriers\: Break Crates|Batter Barriers\: Break Sheet Metal|Batter Barriers\: Break Practice Boxes|Batter Barriers\: Break Wooden Stage Door With Weapon|Batter Barriers\: Break Wooden Stage Door With Shoulder|Batter Barriers\: Bash Critter Boxes|Batter Barriers\: Break Metal Stage Door With Weapon/
					if current_task == "Batter Barriers: Bash Critter Boxes" && UserVars.warrior["turn_in_batter_boxes_tasks"] == "yes"
							trade_in_task.call
					else
						if current_task == "Batter Barriers: Break Wooden Stage Door With Shoulder" || current_task == "Batter Barriers: Break Practice Boxes With Head"
							if UserVars.warrior["container_to_stow_weapon"] != "nil" && UserVars.warrior["container_to_stow_weapon"] != nil && UserVars.warrior["container_to_stow_weapon"] != ""
								fput "put my #{UserVars.warrior["batter_barriers_weapon"]} in my #{UserVars.warrior["container_to_stow_weapon"]}" if checkright =~ /#{UserVars.warrior["batter_barriers_weapon"]}/ or checkleft =~ /#{UserVars.warrior["batter_barriers_weapon"]}/
							end
							store_backsheath
							stow_all.call
						else
							if checkright !~ /#{UserVars.warrior["batter_barriers_weapon"]}/
								if checkleft =~ /#{UserVars.warrior["batter_barriers_weapon"]}/
									fput "swap"
								else
									stow_right.call
									fput "get my #{UserVars.warrior["batter_barriers_weapon"]}"
								end
							end
							sleep 1
							if checkright !~ /#{UserVars.warrior["batter_barriers_weapon"]}/
								if UserVars.warrior["locker_room_number"] == "nil"
									message_string = "Could not find batter barriers weapon and locker information not setup."
									display_message.call
									exit
								else
									if current_task == "Batter Barriers: Bash Critter Boxes"
										this_room = Room.current.id
										message_string = "Could not find batter weapon, will check locker then come back to this room."
										display_message.call
									end
									message_string = "Getting silvers from bank and checking locker for batter barriers weapon."
									display_message.call
									go_to_bank = true
									go_to.call
									fput "withdraw 350 silvers"
									start_script 'go2', [ UserVars.warrior["locker_room_number"] ]
									wait_until { !running? "go2" }
									if way_in = (GameObj.loot.to_a + GameObj.room_desc.to_a).find { |obj| obj.noun =~ /^(?:opening|curtain)$/ }
										move "go #{way_in.noun}"	
									else
										message_string = "Could not find entrance to locker."
										display_message.call
										if current_task == "Batter Barriers: Bash Critter Boxes"								
											start_script 'go2', [ this_room ]
											wait_while { running?('go2') }
										end
										exit
									end
									fput "open locker"
									fput "get #{UserVars.warrior["batter_barriers_weapon"]} from locker"
									fput "close locker"
									move "go #{way_in.noun}"
									sleep 1
									if checkright !~ /#{UserVars.warrior["batter_barriers_weapon"]}/
										message_string = "Could not find batter barriers weapon on character or in locker."
										display_message.call
										if current_task == "Batter Barriers: Bash Critter Boxes"								
											start_script 'go2', [ this_room ]
											wait_while { running?('go2') }
										end
										exit
									else
										if current_task == "Batter Barriers: Bash Critter Boxes"								
											start_script 'go2', [ this_room ]
											wait_while { running?('go2') }
										end
									end
								end
							end
						end
					end
					if current_task == "Batter Barriers: Break Boards"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild boards') }
						current_batter_barriers_material = "board"
					elsif current_task == "Batter Barriers: Break Ice"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild iceblocks') }
						current_batter_barriers_material = "ice"
					elsif current_task == "Batter Barriers: Break Branches"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild branches') }
						current_batter_barriers_material = "branch"
					elsif current_task == "Batter Barriers: Break Crates"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = crate_rooms
						current_batter_barriers_material = "crate"
					elsif current_task == "Batter Barriers: Break Sheet Metal"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = sheet_metal_rooms
						current_batter_barriers_material = "metal"
					elsif current_task == "Batter Barriers: Break Practice Boxes" || current_task == "Batter Barriers: Break Practice Boxes With Head" 
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild wooden boxes') }
						current_batter_barriers_material = "box"
					elsif current_task == "Batter Barriers: Break Wooden Stage Door With Weapon" || current_task == "Batter Barriers: Break Wooden Stage Door With Shoulder"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild wooden stage doors') }
						current_batter_barriers_material = "door"
					elsif current_task == "Batter Barriers: Break Metal Stage Door With Weapon"
						stand_up.call
						move 'out' if checkpaths 'out'
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild metal stage doors') }
						current_batter_barriers_material = "door"
					end
					go_to.call unless current_task == "Batter Barriers: Bash Critter Boxes"
					current_batter_barriers_task = nil
					if current_task == "Batter Barriers: Bash Critter Boxes"
						batter_critter_boxes.call
					else
						batter_barriers_stuff.call
					end
				##########Berserk Tasks##########
				elsif current_task =~ /Berserk\: Sauna|Berserk\: Tub|Berserk\: Dark Chamber/
					stand_up.call
					move 'out' if checkpaths 'out'
					target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild sauna') } if (current_task =~ /Berserk\: Sauna/)
					target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild icetub') } if (current_task =~ /Berserk\: Tub/)
					target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild dark attendant') } if (current_task =~ /Berserk\: Dark Chamber/)
					go_to.call
					if (current_task =~ /Berserk\: Sauna/)
						if Room.current.id == 17233
							fput "go spring"
						else
							fput "go sauna"
						end
					end
					fput "go tub" if (current_task =~ /Berserk\: Tub/)
					berserk_tasks.call
				##########Disarm Tasks##########
				elsif current_task =~ /Disarm Weapon\: Disarm Partner \(#{practice_disarm_weapon_type} weapon\)/
					if UserVars.warrior["turn_in_disarm_partner_tasks"] == "yes"
						trade_in_task.call
					else
						attack_partner_tasks.call
					end
				elsif current_task =~ /Disarm Weapon\: Be Disarmed by Partner \(#{practice_disarm_weapon_type} weapon\)/
					if UserVars.warrior["turn_in_disarm_partner_tasks"] == "yes"
						trade_in_task.call
					else
						be_attacked_by_partner_tasks.call
					end
				elsif current_task =~ /Disarm Weapon: Disarm Wheel \(#{practice_disarm_weapon_type} weapon\)/
					disarm_wheel.call
				##########Tackle Tasks##########
				elsif current_task =~ /Tackle\: Tackle Partner/
					if UserVars.warrior["turn_in_tackle_partner_tasks"] == "yes"
						trade_in_task.call
					else
						attack_partner_tasks.call
					end
				elsif current_task =~ /Tackle\: Be Tackled By Partner/
					if UserVars.warrior["turn_in_tackle_partner_tasks"] == "yes"
						trade_in_task.call
					else
						be_attacked_by_partner_tasks.call
					end
				elsif current_task =~ /Tackle\: Tackle Dummies/
					tackle_dummies.call
				##########Warriorcries Tasks##########
				elsif current_task =~ /War Cries\: Learn War Cries/
					if UserVars.warrior["turn_in_warcry_partner_tasks"] == "yes"
						trade_in_task.call
					else
						be_attacked_by_partner_tasks.call
					end
				##########Warrior Tricks Tasks##########
				elsif current_task =~ /Warrior Tricks\: Masters|Warrior Tricks\: #{current_trick} Audience/
					warrior_tricks_masters_and_audience.call
				##########Masters Tasks##########
				elsif current_task =~ /Batter Barriers\: Masters|Berserk\: Masters|Disarm Weapon\: Masters|Tackle\: Masters|War Cries\: Masters/
					masters_task.call
				##########Chores Tasks##########
				elsif current_task =~ /Scrub Floors|Prune Shrubbery|Polish Armor/
					do_guild_chores.call
				elsif current_task =~ /Rake Leaves/
					rake_leaves.call
				##########Critter Tasks##########
				elsif current_task =~ /Berserk\: Critters|Disarm Weapon\: Disarm Critters|Tackle\: Critters|War Cries\: Critters|Warrior Tricks\: Spit on Critters|Warrior Tricks\: Feint Critters|Warrior Tricks\: Spin Attack Critters|Warrior Tricks\: Haircut on Critters/
					if UserVars.warrior["critter_task_rooms"] =~ /exit/
						echo "Your settings indicate you wish to do critter tasks manually so script is now exiting."
						echo "Once finished with critter task please run the script again."
						exit
					elsif UserVars.warrior["turn_in_disarm_critter_tasks"] == "yes" && current_task =~ /Disarm Weapon\: Disarm Critters/
						trade_in_task.call
					elsif UserVars.warrior["turn_in_tackle_criter_tasks"] == "yes" && current_task =~ /Tackle\: Critters/
						trade_in_task.call
					elsif UserVars.warrior["turn_in_warcry_critter_tasks"] == "yes" && current_task =~ /War Cries\: Critters/
						trade_in_task.call
					elsif UserVars.warrior["turn_in_berserk_critter_tasks"] == "yes" && current_task =~ /Berserk\: Critters/
						trade_in_task.call
					elsif UserVars.warrior["turn_in_tricks_critter_tasks"] == "yes" && current_task =~ /Warrior Tricks\: Spit on Critters|Warrior Tricks\: Feint Critters|Warrior Tricks\: Spin Attack Critters|Warrior Tricks\: Haircut on Critters/
						trade_in_task.call
					else
						critter_tasks.call
					end
				end
			elsif current_task == "finished"
				put_tools_away.call
				turn_in_task.call
			elsif current_task == "get rank"
				if checking_rank_status == nil
					checking_rank_status = true
					message_string = "Getting rank from master." if UserVars.warrior["get_ranks_from_partner"] != "yes"
					message_string = "Getting rank from partner." if UserVars.warrior["get_ranks_from_partner"] == "yes"
					display_message.call
					stand_up.call
					move 'out' if checkpaths 'out'
					if UserVars.warrior["get_ranks_from_partner"] == "yes"
						go_to_partner_room.call
						fput "whisper #{script.vars[2]} can you promote me in #{current_skill_name}?"
						while line = get
							if line =~ /offers to promote you to your next rank/
								fput "GLD accept"
							elsif line =~ /.* promotes you to your next rank/
								(break)
							end
						end
					else
						target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild guildmaster') }
						go_to.call
						if current_skill_name == "War Cries"
							fput "ask #{person} about next warcries"
						else
							fput "ask #{person} about next #{current_skill_name}"
						end
					end
					check_task.call
				elsif checking_rank_status
					message_string = "You must get ranks in other skills before improving #{current_skill_name} further."
					display_message.call
					exit
				end
			elsif current_task == "get task"
				get_task.call
			end
		end
}

#########################################
##############Masters Tasks##############
#########################################

masters_task = proc{
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild masters') }
	go_to.call
	if current_skill_name == "War Cries"
		fput "ask #{person} about training warcries"
	else
		fput "ask #{person} about training #{current_skill_name}"
	end
	store_backsheath
	stow_all.call
	if current_skill_name != "Batter Barriers"
		if current_skill_name == "Disarm Weapon"
			until checkright != nil
				wait_rt.call
				fput "get #{practice_disarm_weapon} from case"
				sleep 0.5
			end
			wait_until { checkright != nil }
			practice_disarm_weapon_id = GameObj.right_hand.id
		end
		if (current_skill_name != "Berserk") && (current_skill_name != "War Cries")
			needed_gld_stance = "offensive"
			check_gld_stance.call
			stance_defensive.call
			waitfor "say"
		elsif current_skill_name == "Berserk"
			while line = get
				if line =~ /Enter Berserk ([a-zA-Z]+)\./
					wait_for_stamina.call
					fput "berserk #{person}"
					break
				end
			end
		elsif current_skill_name == "War Cries"
			while line = get
				if line =~ /Bertrandt\'s Bellow|Yertie\'s Yowlp|Gerrelle\'s Growl|Seanette\'s Shout|Carn\'s Cry|Horland\'s Holler/
					warcry_to_perform = "bellow" if line =~ /Bertrandt\'s Bellow/
					warcry_to_perform = "yowlp" if line =~ /Yertie\'s Yowlp/
					warcry_to_perform = "growl" if line =~ /Gerrelle\'s Growl/
					warcry_to_perform = "shout" if line =~ /Seanette\'s Shout/
					warcry_to_perform = "cry" if line =~ /Carn\'s Cry/
					warcry_to_perform = "holler" if line =~ /Horland\'s Holler/
					sleep 4
					break
				end
			end
		end	
		loop{
			break if (current_task == "finished") || (current_task == "start over again")
			waitrt?
			if checkright == nil && current_skill_name == "Disarm Weapon"
				GameObj.loot.find{ |item|
					if item.id == practice_disarm_weapon_id
						until checkright != nil
							wait_rt.call
							fput "get ##{practice_disarm_weapon_id}"
							sleep 0.1
						end
					else
						until checkright != nil
							wait_rt.call
							fput "get #{practice_disarm_weapon} from case"
							sleep 0.5
						end
					end
					wait_until { checkright != nil }
					practice_disarm_weapon_id = GameObj.right_hand.id
				}
			end
			if current_skill_name != "Berserk"
				needed_gld_stance = "offensive"
				check_gld_stance.call
			end
			stand_up.call
			wait_for_stamina.call
			stance_offensive.call if current_skill_name != "Berserk"
			waitrt?
			if current_skill_name == "Disarm Weapon"
				fput "disarm #{person}"
			elsif current_skill_name == "Tackle"
				until standing?
					waitrt?
					wait_until { !stunned? }
					fput "stand"
					sleep 0.2
				end
				fput "tackle #{person}"
			elsif current_skill_name == "Berserk"
				fput "berserk #{person}"
			elsif current_skill_name == "War Cries"
				fput "warcry #{warcry_to_perform}"
			end
			while line = get
				if line =~ /hasn\'t instructed you to do that yet\./
					if current_skill_name != "Berserk"
						#needed_gld_stance = "offensive"
						#check_gld_stance.call
						#stance_defensive.call
						while line = get
							if line =~ /\[Roll result\:/
								break
							end
						end
					end
					break
				elsif line =~ /You do not know .* yet\./
					echo "The master insists on giving you another lesson. Waiting 5 seconds before trying again."
					sleep 5
					break
				elsif line =~ /Roundtime\:|Round time\:|\[You have \d+ repetition\(s\) remaining\.\]|\.\.\.wait \d+ seconds\.|You might want to stand up first\.|You\'ll need to choose a weapon from the case\.|You haven\'t learned how to disarm without a weapon\!|fails to knock .* away\!/
					break
				elsif line =~ /is not holding a weapon\./
					fput "stance defensive"
					waitfor "picks up"
					break
				elsif line =~ /You need to give your vocal cords a bit of a rest\!/
					echo "Throat too sore to yell anymore. Waiting 60 seconds before resuming."
					sleep 60
					current_task = "start over again"
					break
				elsif line =~ /is already prone/
					fput "stance defensive"
					waitfor "stands back up"
					break
				elsif line =~ /\[You have completed this task\.\]|\[You have completed your training task\.\]|You have already finished that task\.|It would probably be a bad idea to try to harm .* without asking for permission first\./
					current_task = "finished"
					break
				end
			end
		}
		stand_up.call
		move 'out' if checkpaths 'out'
		fput "drop ##{practice_disarm_weapon_id}" if current_skill_name == "Disarm Weapon"
		if (current_task == "start over again")
			check_task.call
		else
			turn_in_task.call
		end
	elsif current_skill_name == "Batter Barriers"
		while line = get
			if line =~ /[a-zA-Z]+ escorts you back to the training grounds\./
				turn_in_task.call
				break
			elsif line =~ /gazes at you with a rather fond expression and drags a box before you/
				current_batter_barriers_material = "box"
				fput "get box"
				batter_barriers_stuff.call
			end
		end
	end
}

#########################################
##########Batter Barriers Tasks##########
#########################################
batter_barriers_stuff = proc{
	if current_task =~ /Batter Barriers\: Break Wooden Stage Door With Weapon|Batter Barriers\: Break Wooden Stage Door With Shoulder/
		fput "go wooden door"
	elsif current_task =~ /Batter Barriers\: Break Metal Stage Door With Weapon/
		fput "go metal door"
	end
	loop{
		wait_until { !stunned? }
		stand_up.call
		if current_batter_barriers_task == "finished"
			break
		else
			waitrt?
			if checkhealth < 30
				if UserVars.warrior["low_health_script"] == "nil"
					message_string = "Waiting for health."
					display_message.call
					wait_until { checkhealth >= 50 }
				else
					message_string = "Running low health script."
					display_message.call
					kill_script "#{UserVars.warrior["low_health_script"]}" if running? "#{UserVars.warrior["low_health_script"]}"
					wait_until { !running? "#{UserVars.warrior["low_health_script"]}" }
					start_script "#{UserVars.warrior["low_health_script"]}"
					wait_while { running? "#{UserVars.warrior["low_health_script"]}" }
					go_to.call				
				end
			end
			if !Spell[506].active?
				if UserVars.warrior["haste_script"] == "nil"
					nil
				else
					message_string = "Running haste script."
					display_message.call
					kill_script "#{UserVars.warrior["haste_script"]}" if running? "#{UserVars.warrior["haste_script"]}"
					wait_until { !running? "#{UserVars.warrior["haste_script"]}" }
					start_script "#{UserVars.warrior["haste_script"]}"
					wait_while { running? "#{UserVars.warrior["haste_script"]}" }
					go_to.call					
				end
			end
			fput "batter #{current_batter_barriers_material}"
			while line = get
				if line =~ /Roundtime\:|Round time\:|\[You have \d+ repetition\(s\) remaining\.\]|\.\.\.wait \d+ seconds\./
					break
				elsif line =~ /What were you referring to\?|I don\'t think so\.\.\.battering (a row of (metal|wooden) stage doors|a stack of cheap wooden boxes|a stack of wooden boxes|a stack of empty crates|a pile of stripped branches|a stack of sheet metal|a pile of rotten boards) would only cause trouble\!|You need to pick that up and batter it without any tools\./
					waitrt?
					checking_status = true
					check_task.call
					checking_status = nil
					if current_task == "finished"
						current_batter_barriers_task = "finished"
					else
						if current_task == "Batter Barriers: Break Boards"
							fput "get board"
						elsif current_task == "Batter Barriers: Break Branches"
							fput "get branch"
						elsif current_task == "Batter Barriers: Break Ice"
							fput "get block"
						elsif current_task == "Batter Barriers: Break Crates"
							fput "get crate"
						elsif current_task == "Batter Barriers: Break Sheet Metal"
							fput "get metal"
						elsif current_task == "Batter Barriers: Break Practice Boxes" || current_task == "Batter Barriers: Break Practice Boxes With Head"
							fput "get box"
						elsif current_task == "Batter Barriers: Masters"
							fput "get box"
						end
						current_batter_barriers_task = "not done"
					end
					break
				elsif line =~ /Fun as it might be\, you should save that for someone who might need it for training\./
					waitrt?
					current_batter_barriers_task = "finished"
					break
				end
			end
			sleep 0.1
		end
	}
	turn_in_task.call
}

batter_critter_boxes = proc{
	if UserVars.warrior["critter_boxes_room"] != "nil" && UserVars.warrior["critter_boxes_room"] != nil && UserVars.warrior["critter_boxes_room"] != ""
		if Room.current.id != UserVars.warrior["critter_boxes_room"].to_i
			start_script 'go2', [ UserVars.warrior["critter_boxes_room"] ]
			wait_while { running?('go2') }
		end
	end		
	wait_until { !stunned? }
	stand_up.call
	boxes_here = nil
	GameObj.loot.each { |item|
		if item.type =~ /box/
			boxes_here = true
		end
	}
	if boxes_here == nil
		message_string = "Script will bash boxes that are on the ground for this task. If no boxes are found the script will exit."
		display_message.call
		exit
	end
	GameObj.loot.find { |item|
		if item.type =~ /box/
			while item.status !~ /gone/
				wait_rt.call
				fput "batter ##{item.id}"
			end
			wait_rt.call
			fput "get coins"
			wait_rt.call
			GameObj.loot.each { |stuff|
				if stuff.name !~ /staircase|spring|disk|coffin/ && stuff.type !~ /cursed|herb|food|junk|scarab|box/
					wait_rt.call
					fput "get #{stuff}"
					fput "stow #{stuff}"
				end
			}
		end
	}
	checking_status = true
	check_task.call
	checking_status = nil
	waitrt?
	if current_task == "finished"
		if UserVars.warrior["critter_boxes_room"] == "nil"
			GameObj.loot.each { |item|
				if item.type =~ /box/
					wait_rt.call
					fput "get #{item}"
					fput "stow #{item}"
				end
			}
		end
		go_to_bank = true
		go_to.call
		turn_in_task.call
	else
		batter_critter_boxes.call
	end
}

#########################################
##############Berserk Tasks##############
#########################################	
berserk_tasks = proc{
	if main_task =~ /Berserk\: Sauna|Berserk\: Tub/
		loop{
			waitrt?
			if current_task == "enough"
				wait_for_stamina.call
				check_popped_muscles.call
				fput "berserk"
				while line = get
					if line =~ /Roundtime\:|Round time\:|\[You have \d+ repetition\(s\) remaining\.\]|\.\.\.wait \d+ seconds\./
						break
					elsif line =~ /^\[You have completed this task\.\]/
						current_task = "finished"
						break
					elsif line =~ /To get the most out of this excercise\, it helps if you\'re nearly delirious with heat exhaustion\.  Maybe you should try meditating for a while\./
						current_task = "not done"
						break
					end
				end
			elsif current_task == "finished"
				break
			else
				if main_task =~ /Berserk\: Tub/
					fput "splash"
				elsif main_task =~ /Berserk\: Sauna/
					fput "meditate"
				end
				while line = get
					if line =~ /Roundtime\:|Round time\:|\.\.\.wait \d+ seconds\./
						break
					elsif line =~ /You\'re cold enough already\!  Time to stop splashing and start berserking\!|You\'re hot enough\!  Time to stop meditating and start berserking\!/
						current_task = "enough"
						break
					end
				end
			end
		}
	elsif main_task =~ /Berserk\: Dark Chamber/
		loop{
			until Spell[9607].active?
				waitrt?
				fput "kneel" if !kneeling?
				wait_for_stamina.call
				check_popped_muscles.call
				current_stamina = checkstamina
				fput "berserk"
				if checkstamina >= current_stamina
					break
				else
					nil
				end
				sleep 0.1
			end
			wait_until { !Spell[9607].active? }
			checking_status = true
			check_task.call
			checking_status = nil
			if current_task == "finished"
				break
			end
		}
	end
	turn_in_task.call
}

#########################################
##############Disarm Tasks###############
#########################################

disarm_wheel = proc{
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild wheel') }
	go_to.call
	fput "go wheel"
	store_backsheath
	stow_all.call
	until checkright != nil
		wait_rt.call
		fput "get #{practice_disarm_weapon} from case"
		sleep 0.5
	end
	wait_until { checkright != nil }
	practice_disarm_weapon_id = GameObj.right_hand.id
	loop{
		break if current_task == "finished"
		wait_rt.call
		wait_for_stamina.call
		fput "disarm wheel"
		while line = get
			if line =~ /Roundtime\:|Round time\:|\[You have \d+ repetition\(s\) remaining\.\]|\.\.\.wait \d+ seconds\./
				break
			elsif line =~ /\[You have completed your training task\.\]|You\'re done with this task for now\, you should see the Training Administrator for what to do next\./
				current_task = "finished"
				break
			elsif line =~ /The broken workout wheel appears to need a little bit of repair before it will work properly\./
				wait_rt.call
				fput "fix wheel"
				break
			end
		end
		sleep 0.1
	}
	stand_up.call
	fput "drop ##{practice_disarm_weapon_id}"
	turn_in_task.call
}	

#########################################
##############Tackle Tasks###############
#########################################

tackle_dummies = proc{
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild dummies') }
	go_to.call
	store_backsheath
	stow_all.call
	fput "go dummies"
	loop{
		break if current_task == "finished"
		wait_rt.call
		stand_up.call
		wait_for_stamina.call
		fput "tackle dummy"
		while line = get
			if line =~ /Roundtime\:|Round time\:|\[You have \d+ repetition\(s\) remaining\.\]|\.\.\.wait \d+ seconds\.|You must stand first\./
				break
			elsif line =~ /\[You have completed your training task\.\]|You\'re done with this task for now\, you should see the Training Administrator for what to do next\./
				current_task = "finished"
				break
			elsif line =~ /The tackling dummy is lying on the ground right now\.|You\'ll need to set the tackling dummy in motion to learn anything from it\./
				wait_rt.call
				fput "pull dummy" if line =~ /The tackling dummy is lying on the ground right now\./
				fput "push dummy" if line =~ /You\'ll need to set the tackling dummy in motion to learn anything from it\./
				break
			end
		end
		sleep 0.1
	}
	stand_up.call
	turn_in_task.call
}

#########################################
##########Warrior Tricks Tasks###########
#########################################
warrior_tricks_masters_and_audience = proc{
	if (current_number_of_ranks_for_current_skill == 62) && (main_task == "Warrior Tricks: Masters")
		stand_up.call
		move 'out' if checkpaths 'out'
		target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild shop master') }
		go_to.call
		fput "ask #{person} about train tricks"
		while (line = get)
			if (line =~ /\[You have completed this task\.\]/)
				break
			end
		end
		wait_rt.call
		store_backsheath
		stow_all.call
		stand_up.call
		turn_in_task.call
	else
		trick_location = nil
		if main_task == "Warrior Tricks: Masters"
			stand_up.call
			move 'out' if checkpaths 'out'
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild masters') }
			go_to.call
			fput "ask #{person} about training #{current_skill_name}"
			while line = get
				if line =~ /places the handle of .* on (his|her) (palm|finger|foot|chin|nose)/i
					trick_location = $2
				elsif line =~ /makes a wet gargling sound and spits .* (shirt|feet|foot|hand|face|eye)/
					trick_location = $1
					if trick_location =~ /foot/
						trick_location = "left foot"
					elsif trick_location =~ /hand/
						trick_location = "left hand"
					elsif trick_location =~ /eye/
						trick_location = "left eye"
					end
				elsif line =~ /but just with (two)/
					trick_location = $1
				elsif line =~ /Type WTRICK (.*) to practice this trick\./
					trick_to_perform = $1
					if trick_to_perform == "BALANCE"
						if trick_location == nil
							trick_to_perform = "BALANCE palm"
						else
							trick_to_perform = "BALANCE #{trick_location}"
						end
					elsif trick_to_perform == "SPIT"
						trick_to_perform = "SPIT DUMMY #{trick_location}"
					elsif trick_to_perform == "JUGGLE"
						wait_rt.call
						store_backsheath
						stow_all.call
						if trick_location == "two"
							trick_to_perform = "JUGGLE 2"
						end
						fput "get broadsword from case"
						fput "get club from case"
					elsif trick_to_perform == "HAIRCUT"
						wait_rt.call
						store_backsheath
						stow_all.call
						fput "get broadsword from case"
						trick_to_perform = "HAIRCUT #{person}"
					elsif trick_to_perform == "FEINT"
						trick_to_perform = "FEINT #{person}"
					elsif trick_to_perform == "BACKFLIP"
						wait_rt.call
						store_backsheath
						stow_all.call
						fput "get broadsword from case"
					end
					break
				elsif line =~ /escorts you back to the training grounds/
					current_task = "finished"
					sleep 1
					break
				end
			end
		elsif main_task == "Warrior Tricks: #{current_trick} Audience"
			if trick_to_perform =~ /guzzle/
				go_to_bank = true
				go_to.call
				fput "withdraw 3000"
			elsif trick_to_perform =~ /juggle/i
				wait_rt.call
				store_backsheath
				stow_all.call
			end
			stand_up.call
			move 'out' if checkpaths 'out'
			target_room_list = Map.list.find_all { |room| room.tags.include?('town') }
			go_to.call
		end
		loop{
			break if (current_task == "finished") || (current_task == "need sheath") || (current_task == "need to buy tricks weapon")
			if current_task == "need tricks weapon"
				if tricks_weapon
					fput "get ##{tricks_weapon}"
					current_task = nil
				else
					check_for_weapons.call
					if tricks_weapon
						fput "get ##{tricks_weapon}"
						current_task = nil
					else
						current_task = "need to buy tricks weapon"
						break
					end
				end
			end
			people_here = 0
			GameObj.pcs.each{ people_here += 1 }
			wait_for_stamina.call
			start_time = Time.now
			if (trick_to_perform =~ /draw/i || trick_to_perform =~ /JUGGLE/i) && (main_task == "Warrior Tricks: #{current_trick} Audience")
				Thread.new{
					sleep 3
					check_gld_stance.call
				}
			end
			if trick_to_perform =~ /JUGGLE/i
				store_backsheath	
				stow_all.call
			end
			fput "wtrick #{trick_to_perform}"
			while line = get				
				if line =~ /You need to hold a weapon in your right hand to do this\.|You need to be holding a weapon to do that\.|You need to hold a weapon in your right hand with your left hand empty\./
					store_backsheath
					stow_all.call
					fput "get my #{UserVars.warrior["weapon"]}"
					break
				elsif line =~ /^\[You have completed this task\.\]/
					current_task = "finished"
					break
				elsif line =~ /\[You have \d+ repetition\(s\) remaining\.\]/
					break
				elsif line =~ /You don't want to be a pest\.  You should wait (\d+) seconds\, or your audience might be irritated rather than impressed\./
					sleep $1.to_i
					break
				elsif line =~ /You need to be holding an ordinary drink item in your right hand\.  Be sure it still has a few sips left\./
					if main_task == "Warrior Tricks: Masters"
						fput "get grog"
					elsif main_task == "Warrior Tricks: #{current_trick} Audience"
						store_backsheath
						stow_all.call
						get_drink_for_guzzle_trick.call
					end
					break
				elsif line =~ /You need to be wearing an open and empty weapon sheath/
					message_string = "Buying sheath to finish task."
					display_message.call
					current_task = "need sheath"
					break
				elsif line =~ /The .* isn\'t very suitable for that sort of thing\.|The .* isn\'t suitable for that trick\.|The .* isn\'t suitable for that sort of thing\.|The .* isn\'t suitable for that maneuver\.|The .* is too ungainly for you to use in that fashion\.|The .* isn\'t big enough to act as your center of balance\.|With .*\?  Are you sure you wouldn\'t rather use a toothpick\!\?\?|The .* is a bit short to try that\./
					if GameObj.right_hand.id == tricks_weapon
						current_task = "need to buy tricks weapon"
					else
						message_string = "Your main weapon does not work for this trick, looking for suitable weapon."
						display_message.call
						current_task = "need tricks weapon"
					end
					store_backsheath
					stow_all.call
					break
				elsif line =~ /You\'re a bit busy to do that just now\./
					if trick_to_perform =~ /BALANCE/i
						fput "stop balance"
					elsif trick_to_perform =~ /JUGGLE/i
						fput "stop juggle"
					end
					break
				elsif line =~ /\[Total modified roll \= (\d+)\]/
					end_modified_roll = $1.to_i
					if end_modified_roll <= 100
						break
					elsif (end_modified_roll > 100) && (trick_to_perform =~ /JUGGLE/i) && (main_task =~ /Warrior Tricks\: #{current_trick} Audience/i)
						while line = get
							if line =~ /You can\'t seem to find .* weapons that are suitable for juggling\./
								wait_rt.call
								store_backsheath
								stow_all.call
								current_task = "need to buy tricks weapon"
								break
							elsif line =~ /You gather up/
								break
							end
						end
					end
				elsif line =~ /You need to have your left hand free\.|You need your left hand free to do this trick\./
					stow_left.call
					break
				elsif line =~ /You need a weapon in your right hand to act as your center of balance\.|You need to be holding a weapon in your right hand\.|You need to be holding a weapon in your right hand to do that\./
					wait_rt.call
					stow_right.call
					fput "get my #{UserVars.warrior["weapon"]}"
					break
				elsif line =~ /You need at least one hand free\.|You\'ve already got a weapon ready\./
					store_backsheath
					stow_all.call
					break
				elsif line =~ /Invalid trick\./
					echo "The master insists on giving you another lesson. Waiting 5 seconds before trying again."
					sleep 5
					break	
				elsif line =~ /You need to be holding a weapon in your right hand and an edible \(non\-herb\) item in your left\./
					wait_rt.call
					if tricks_weapon
						stow_right.call
						fput "get ##{tricks_weapon}"
					else
						if GameObj.right_hand.name !~ /#{UserVars.warrior["weapon"]}/
							stow_right.call
							fput "get my #{UserVars.warrior["weapon"]}"
						end
					end
					if (main_task == "Warrior Tricks: #{current_trick} Audience")
						get_drink_for_guzzle_trick.call
					else
						if GameObj.left_hand.name !~ /apple/
							stow_left.call
							fput "get apple"
						end
					end
					break
				elsif (line =~ /Roundtime/) || (Time.now > (start_time + 2))
					if current_task == "need to buy tricks weapon"
						break
					else
						wait_rt.call
						if trick_to_perform =~ /BALANCE/i
							fput "stop balance"
						end
						if trick_to_perform =~ /JUGGLE/i
							fput "stop juggle"
						end
						if (main_task == "Warrior Tricks: #{current_trick} Audience") || ((Time.now > (start_time + 2)) && (trick_to_perform =~ /draw/i) && (main_task == "Warrior Tricks: #{current_trick} Audience"))
							if (UserVars.warrior["do_work_in_other_guilds"] == "yes") && (Room.current.id == 2300 || Room.current.id == 1438)
								message_string = "You did not get a rep. There are #{people_here} people here. Audience reps require a minimum of 5 non-guild members or 2 guild masters. Running to Landing to continue working on task."
								display_message.call
								store_backsheath
								stow_all.call
								fput "get my #{UserVars.warrior["weapon"]}" if UserVars.warrior["weapon"] != "nil" && UserVars.warrior["weapon"] != nil && UserVars.warrior["offhand"] != ""
								fput "get my #{UserVars.warrior["offhand"]}" if UserVars.warrior["offhand"] != "nil" && UserVars.warrior["offhand"] != nil && UserVars.warrior["offhand"] != ""
								start_script 'go2', [ 228 ]
								wait_while { running?('go2') } 
							else
								message_string = "You did not get a rep. There are #{people_here} people here. Audience reps require a minimum of 5 non-guild members or 2 guild masters. Trying again in 20 seconds."
								display_message.call
								sleep 20
							end
						end
						break
					end
				end
			end
			waitrt?
			sleep 0.1

		}
		if trick_to_perform =~ /BALANCE/i
			fput "stop balance"
		elsif trick_to_perform =~ /JUGGLE/i
			fput "stop juggle"
		elsif trick_to_perform =~ /TSHEATH/i
			if (tricks_weapon)
				fput "get my #{tricks_weapon}"	
				fput "stow my #{tricks_weapon}"
			else
				fput "get my #{UserVars.warrior["weapon"]}"
				fput "stow my #{UserVars.warrior["weapon"]}"
			end
		end
		wait_rt.call
		store_backsheath
		stow_all.call
		stand_up.call
		move 'out' if checkpaths 'out'
		if current_task == "need sheath"
			buy_sheath.call
		elsif current_task == "need to buy tricks weapon"
			buy_needed_weapon.call
		elsif current_task == "finished"
			turn_in_task.call
		end
	end
}

get_drink_for_guzzle_trick = proc{
	message_string = "Getting drink from Warrior Guild." if trick_to_perform == "guzzle"
	message_string = "Getting food item from Warrior Guild." if trick_to_perform == "tslice"
	display_message.call
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild snacks') }
	go_to.call
	if trick_to_perform == "guzzle"
		if Room.current.id == 17246
			fput "get ale"
		else
			if ($drink_item == nil) || ($guzzle_room_number != Room.current.id)
				$guzzle_room_number = nil
				$drink_item = nil
				GameObj.room_desc.each{ |thing|
					fput "look on ##{thing.id}"
					thing.contents.each { |item|
						fput "eat #{item.noun}"
						while line = get
							if (line =~ /I don\'t think you are supposed to eat that\./)
								$drink_item = item.noun
								break
							elsif line =~ /You must pick it up first\./
								break
							end
						end
						if $drink_item
							break
						end
					}
					break if $drink_item
				}
				if $drink_item == nil
					GameObj.loot.each{ |thing|
						fput "look on ##{thing.id}"
						thing.contents.each { |item|
							fput "eat #{item.noun}"
							while line = get
								if line =~ /I don't think you are supposed to eat that\./
									$drink_item = item.noun
									break
								elsif line =~ /You must pick it up first\./
									break
								end
							end
							if $drink_item
									break
							end
						}
						break if $drink_item
					}
				end
				$guzzle_room_number = Room.current.id
			end
			fput "get #$drink_item"
		end
	elsif trick_to_perform == "tslice"
		if Room.current.id == 17246
			fput "stow left" if checkleft
			fput "get venison"
		else
			if ($food_item == nil) || ($food_room_number != Room.current.id)
				$food_room_number = nil
				$food_item = nil
				GameObj.room_desc.each{ |thing|
					fput "look on ##{thing.id}"
					thing.contents.each { |item|
						fput "eat #{item.noun}"
						while line = get
							if (line =~ /I don\'t think you are supposed to eat that\./)
								break
							elsif line =~ /You must pick it up first\./
								$food_item = item.noun
								break
							end
						end
						if $food_item
							break
						end
					}
					break if $food_item
				}
				if $food_item == nil
					GameObj.loot.each{ |thing|
						fput "look on ##{thing.id}"
						thing.contents.each { |item|
							fput "eat #{item.noun}"
							while line = get
								if line =~ /I don't think you are supposed to eat that\./
									break
								elsif line =~ /You must pick it up first\./
									$food_item = item.noun
									break
								end
							end
							if $food_item
									break
							end
						}
						break if $food_item
					}
				end
				$food_room_number = Room.current.id
			end
			(fput "stow left") if (checkleft)
			fput "get #$food_item"
		end
	end
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('town') }
	go_to.call
}

buy_sheath = proc{
	order_number = Array.new
	order_name = Hash.new
	store_backsheath
	stow_all.call
	go_to_bank = true
	go_to.call
	fput "withdraw 500"
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('general store') }
	go_to.call
	fput "order"
	while line = get
		if line =~ /\s*(\d+)\.\s+[a|an] (\D+)\s*(\d+)\.\s+[a|an] (\D+)/
			number += 1
			order_number[number] = $1
			order_name[number] = $2
			if order_name[number] =~ /harness|scabbard/
				break
			end
			number += 1
			order_number[number] = $3
			order_name[number] = $4
			if order_name[number] =~ /harness|scabbard/
				break
			end
		elsif line =~ /\s*(\d+)\.\s+[a|an] (\D+)/
			number += 1
			order_number[number] = $1
			order_name[number] = $2
			if order_name[number] =~ /harness|scabbard/
				break
			end
		elsif line =~ /APPRAISE|INSPECT|DESCRIBE|ORDER|BUY|ORDER HELP/
			break
		end
	end
	fput "order #{order_number[number]}"
	fput "buy"
	fput "wear my #{checkright}"
	current_skill_start.call
}

buy_needed_weapon = proc{
	message_string = "Need a suitable weapon. Going to nearest weapon shop to purchase one."
	display_message.call
	stow_right.call
	stow_left.call unless current_task == "Disarm Weapon: Disarm Critters (#{practice_disarm_weapon_type} weapon)"
	wait_until { checkright == nil }
	go_to_bank = true
	go_to.call
	fput "withdraw 500"
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('weaponshop') }
	go_to.call
	if (current_skill_name == "Disarm Weapon")
		if practice_disarm_weapon_type =~ /blunt/
			weapon_type_to_check = "blunt"
		elsif practice_disarm_weapon_type =~ /brawling/
			weapon_type_to_check = "brawling"
		elsif practice_disarm_weapon_type =~ /edged/
			weapon_type_to_check = "edged"
		elsif practice_disarm_weapon_type =~ /polearm/
			weapon_type_to_check = "polearm"
		elsif practice_disarm_weapon_type =~ /twohanded/
			weapon_type_to_check = "twohanded"
		end
	elsif (current_skill_name == "Warrior Tricks")
		if trick_to_perform =~ /wflip|tsheath|spin|balance|initial|juggle|tslice|ksheath/i
			weapon_type_to_check = "edged"
		elsif trick_to_perform =~ /backflip|whop|haircut/i
			weapon_type_to_check = "large"
		end
	end
	if weapon_type_to_check == "blunt"
		cheapest_weapon_to_buy = $cheapest_blunt_weapon
		weapon_field_to_check = blunt_weapons
	elsif weapon_type_to_check == "brawling"
		cheapest_weapon_to_buy = $cheapest_brawling_weapon
		weapon_field_to_check = brawling_weapons
	elsif weapon_type_to_check == "edged"
		cheapest_weapon_to_buy = $cheapest_edged_weapon
		weapon_field_to_check = edged_weapons
	elsif weapon_type_to_check == "polearm"
		cheapest_weapon_to_buy = $cheapest_polearm_weapon
		weapon_field_to_check = polearm_weapons
	elsif weapon_type_to_check == "twohanded"
		cheapest_weapon_to_buy = $cheapest_twohanded_weapon
		weapon_field_to_check = twohanded_weapons
	elsif weapon_type_to_check == "large"
		cheapest_weapon_to_buy = $cheapest_large_weapon
		weapon_field_to_check = large_weapons
	end
	if (cheapest_weapon_to_buy == nil) || ($checked_weapon_room != Room.current.id)
		message_string = "Looking for cheapest suitable weapon."
		display_message.call
		number = 0
		current_lowest_cost = 100000
		$cheapest_blunt_weapon = nil
		$cheapest_brawling_weapon = nil
		$cheapest_edged_weapon = nil
		$cheapest_polearm_weapon = nil
		$cheapest_twohanded_weapon = nil
		$cheapest_large_weapon = nil
		$checked_weapon_room = nil
		cheapest_weapon_to_buy = nil
		fput "order"
		while line = get
			if line =~ /\s*(\d+)\.\s+[a|an] (\D+)\s*(\d+)\.\s+[a|an] (\D+)/
				number += 1
				order_number[number] = $1
				order_name[number] = $2
				number += 1
				order_number[number] = $3
				order_name[number] = $4
			elsif line =~ /\s*(\d+)\.\s+[a|an] (\D+)/
				number += 1
				order_number[number] = $1
				order_name[number] = $2
			elsif line =~ /APPRAISE|INSPECT|DESCRIBE|ORDER|BUY|ORDER HELP/
				break
			end
		end
		order_name.each { |h,i|
			if order_name[h] =~ weapon_field_to_check
				fput "inspect #{order_number[h]}"
				while line = get
					if line =~ /requires skill in (.*) to use/
						current_checked_weapon_type = $1
						if (current_checked_weapon_type !~ /#{weapon_type_to_check}/) && (weapon_type_to_check != "large")
							current_checked_weapon_type = nil
						end
						break
					end
				end
				if current_checked_weapon_type
					fput "order #{order_number[h]}"
					while line = get
						if line =~ /(\d+)/
							silver_cost[h] = $1.to_i
							if silver_cost[h] < current_lowest_cost
								current_lowest_cost = silver_cost[h]
								cheapest_weapon_to_buy = order_number[h]
							end
							break
						end
					end
				end
			end
		}
	end
	$checked_weapon_room = Room.current.id
	fput "order #{cheapest_weapon_to_buy}"
	fput "buy"
	wait_until { checkright != nil }
	if (trick_to_perform =~ /juggle/i) && (current_skill_name == "Warrior Tricks")
		fput "order #{cheapest_weapon_to_buy}"
		fput "buy"
	end
	if weapon_type_to_check == "blunt"
		$cheapest_blunt_weapon = cheapest_weapon_to_buy
		$current_blunt_be_disarmed_weapon = GameObj.right_hand.id
	elsif weapon_type_to_check == "brawling"
		$cheapest_brawling_weapon = cheapest_weapon_to_buy
		$current_brawling_be_disarmed_weapon = GameObj.right_hand.id
	elsif weapon_type_to_check == "edged"
		$cheapest_edged_weapon = cheapest_weapon_to_buy
		$current_edged_be_disarmed_weapon = GameObj.right_hand.id
	elsif weapon_type_to_check == "polearm"
		$cheapest_polearm_weapon = cheapest_weapon_to_buy
		$current_polearm_be_disarmed_weapon = GameObj.right_hand.id
	elsif weapon_type_to_check == "twohanded"
		$cheapest_twohanded_weapon = cheapest_weapon_to_buy
		$current_twohanded_be_disarmed_weapon = GameObj.right_hand.id
	elsif weapon_type_to_check == "large"
		$cheapest_large_weapon = cheapest_weapon_to_buy
	end
	tricks_weapon = GameObj.right_hand.id
	if (current_skill_name == "Warrior Tricks")
		store_backsheath
		stow_all.call
		current_skill_start.call
	end
}

#########################################
##############Critter Tasks##############
#########################################
critter_tasks = proc{
	waitrt?
	get_weapon_and_off_hand.call
	need_to_rest_vocal_cords = nil
	#if current_task == "Disarm Weapon: Disarm Critters (#{practice_disarm_weapon_type} weapon)"
	#	stow_right.call
	#	check_for_weapons.call
	#	if current_disarm_others_weapon
	#		fput "get ##{current_disarm_others_weapon}"
	#	else
	#		this_room = Room.current.id
	#		buy_needed_weapon.call
	#		start_script 'go2', [ this_room ]
	#		wait_while { running?('go2') }
	#	end
	#	fput "get my #{UserVars.warrior["main_disarm_weapon"]}"
	#end
	stance_defensive.call
	needed_gld_stance = "offensive"
	check_gld_stance.call
	loop{
		if current_task == "finished"
			turn_in_task.call
			break
		elsif current_task == "wander" || current_task == "not finished" || current_task == "Berserk: Critters" || current_task == "Tackle: Critters" || current_task == "Disarm Weapon: Disarm Critters (#{practice_disarm_weapon_type} weapon)" || current_task =~ /Warrior Tricks\: Spit on Critters/ || current_task =~ /Warrior Tricks\: Feint Critters/ || current_task =~ /Warrior Tricks\: Spin Attack Critters/ || current_task =~ /War Cries\: Critters/ || current_task =~ /Warrior Tricks\: Haircut on Critters/
			wander_critter_tasks.call
		elsif current_task == "critter task attack"
			critter_task_on_critter.call
		elsif current_task == "check room"
			check_room_acceptable.call
		end
		sleep 0.1
	}
}

critter_task_on_critter = proc{
	if critter_here && critter_task_target
		check_popped_muscles.call
		if current_skill_name == "Berserk"
			until Spell[9607].active? || checkstamina < 20
				fput "berserk"
			end
			loop{
				sleep 4
				fput "stop berserk"
				sleep 1
				break if !Spell[9607].active?
			}
		elsif current_skill_name == "Tackle"
			until checkstance =~ /#{UserVars.warrior["critter_tackle_stance"]}/i
				wait_rt.call
				fput "stance #{UserVars.warrior["critter_tackle_stance"]}"
				sleep 0.1
			end
			if UserVars.warrior["critter_tackle_stow_weapon"] == "yes"
				stow_right.call
			end
			if UserVars.warrior["critter_tackle_stow_off_hand"] == "yes"
				stow_left.call
			end
			wait_rt.call
			stand_up.call
			waitrt?
			fput "tackle #{critter_task_target}"
			waitrt?
			get_weapon_and_off_hand.call
			stance_defensive.call
			stand_up.call
		elsif current_skill_name == "Disarm Weapon"
			stance_offensive.call
			wait_rt.call
			stand_up.call
			fput "disarm #{critter_task_target}"
			waitrt?
			stance_defensive.call
			stand_up.call
		elsif (current_skill_name == "Warrior Tricks")
			stance_offensive.call unless (trick_to_perform == "sattack") || (trick_to_perform == "haircut")
			wait_rt.call
			stand_up.call
			if trick_to_perform == "spit"
				fput "wtrick spit #{critter_task_target} shirt"
			elsif trick_to_perform == "feint"
				fput "wtrick feint #{critter_task_target}"
			elsif trick_to_perform == "sattack"
				stance_defensive.call
				fput "wtrick sattack #{critter_task_target}"
			elsif trick_to_perform == "haircut"
				fput "wtrick haircut #{critter_task_target}"
			end
		elsif (current_skill_name == "War Cries")
			wait_rt.call
			stand_up.call
			result = dothistimeout "warcry #{warcry_to_perform} #{critter_task_target}", 2, /Roundtime|You need to give your vocal cords a bit of a rest\!/
			if result =~ /Roundtime/
				waitrt?
			elsif result =~ /You need to give your vocal cords a bit of a rest\!/
				waitrt?
				need_to_rest_vocal_cords = true
			elsif result.nil?
				waitrt?
			end
		end
		current_task = nil
		check_critter_task_status.call
		wait_until { current_task }
		if current_task == "finished"
			nil			
		else
			if need_to_rest_vocal_cords
				current_task = "need to rest vocal cords"
			end
			wait_until { !Spell[9607].active? } if current_skill_name == "Berserk"
			if (checkstamina < 20) || (current_task == "need to rest vocal cords")
				if UserVars.warrior["critter_task_resting_room"] != "nil" && UserVars.warrior["critter_task_resting_room"] != nil && UserVars.warrior["critter_task_resting_room"] != ""
					this_room = Room.current.id
					message_string = "Heading to resting spot."
					display_message.call
					kill_script "go2" if running? "go2"
					wait_until { !running? "go2" }
					start_script 'go2', [ UserVars.warrior["critter_task_resting_room"] ]
					wait_while { running?('go2') }
					if UserVars.warrior["critter_task_pre_rest_command"] != "nil" && UserVars.warrior["critter_task_pre_rest_command"] != nil && UserVars.warrior["critter_task_pre_rest_command"] != ""
						fput "#{UserVars.warrior["critter_task_pre_rest_command"]}"
					end
				end
				if current_task == "need to rest vocal cords"
					message_string = "Waiting for vocal cords to recover."
				else
					message_string = "Waiting for stamina."
				end
				display_message.call
				if current_task == "need to rest vocal cords"
					while (line = get)
						if (line =~ /Your vocal cords feel fully rested from all those war cries\./)
							break
						end
					end
				else
					wait_until { percentstamina >= 90 }
				end
				need_to_rest_vocal_cords = nil
				message_string = "Finding critters to perform guild task on."
				display_message.call
				kill_script "go2" if running? "go2"
				wait_until { !running? "go2" }
				start_script 'go2', [ this_room ]
				wait_while { running?('go2') }
				current_task = "wander"
			else
				if current_skill_name == "Disarm Weapon"
					current_task = "wander"
				elsif (current_skill_name == "Warrior Tricks" && trick_to_perform == "spit" ) || (current_skill_name == "War Cry")
					check_spit_status.call
					if spit_status == "good"
						current_task = "check room"
					elsif spit_status == "bad"
						if UserVars.warrior["critter_task_resting_room"] != "nil" && UserVars.warrior["critter_task_resting_room"] != nil && UserVars.warrior["critter_task_resting_room"] != ""
							this_room = Room.current.id
							message_string = "Ran out of spit, heading back to town for a few seconds."
							display_message.call
							kill_script "go2" if running? "go2"
							wait_until { !running? "go2" }
							start_script 'go2', [ UserVars.warrior["critter_task_resting_room"] ]
							wait_while { running?('go2') }
							if UserVars.warrior["critter_task_pre_rest_command"] != "nil" && UserVars.warrior["critter_task_pre_rest_command"] != nil && UserVars.warrior["critter_task_pre_rest_command"] != ""
								fput "#{UserVars.warrior["critter_task_pre_rest_command"]}"
							end
						end
						message_string = "Waiting 15 seconds to check if I can spit again."
						display_message.call
						loop{
							sleep 15
							check_spit_status.call
							if spit_status == "good"
								break
							end
							message_string = "Still can't spit, waiting another 15 seconds to check if I can spit again."
							display_message.call
						}
						message_string = "Finding critters to spit on."
						display_message.call
						kill_script "go2" if running? "go2"
						wait_until { !running? "go2" }
						start_script 'go2', [ this_room ]
						wait_while { running?('go2') }
						current_task = "wander"
					end
				else
					current_task = "check room"
				end
			end
		end
	else
		current_task = "wander"
	end
}

check_room_acceptable = proc{
	person_here = nil
	disk_here = nil
	possible_hidden_person_here = nil
	critter_here = nil
	critter_task_target = nil
	checkpcs.each { |pc| 
		if pc != nil
			person_here = true
		end
	}
	GameObj.loot.each { |obj|
		if (obj.noun == 'disk|coffin') && (obj.name !~ /#{checkname}/) 
				disk_here = true
		end
	}
	GameObj.npcs.each { |npc| 
		if npc.status =~ /dead|stun|sleep|prone|lay|lie|lying/
			possible_hidden_person_here = true
		end
	}
	if disk_here || person_here || possible_hidden_person_here
		nil
	else
		GameObj.npcs.each{ |npc|
			if npc.name =~ /#{UserVars.warrior["critter_task_names"]}/ && npc.status !~ /dead/
				critter_here = true
			end
		}
		if critter_here
			critter_task_target = GameObj.npcs.find { |npc|
				npc.name =~ /#{UserVars.warrior["critter_task_names"]}/ && npc.status !~ /dead|prone|sit|lay|kneel|lying/
			}
		end
	end
	current_task = "critter task attack"
}

wander_critter_tasks = proc {
	sleep 0.1
	room = Room.current
	acceptable_adjacent_rooms = room.wayto.keys & critter_task_rooms
	not_visited_rooms = acceptable_adjacent_rooms.find_all { |r| not wander_rooms.include?(r) }
	if not_visited_rooms.empty?
		next_room = wander_rooms.find { |r| acceptable_adjacent_rooms.include?(r) }
	else
		next_room = not_visited_rooms[rand(not_visited_rooms.length)]
	end
	if next_room
		wander_rooms.delete(next_room)
		wander_rooms.push(next_room)
		way = room.wayto[next_room]
		if way.class == String 
			move(way)
			current_task = "check room"
		else
			way.call
			current_task = "check room"	
		end
	else
		kill_script "go2" if running? "go2"
		wait_until { !running? "go2" }
		start_script 'go2', [ Room.current.find_nearest(critter_task_rooms.collect { |id| id.to_i }).to_s ]
		wait_while { running?('go2') }
		current_task = "check room"
	end
}

#########################################
####################Misc#################
#########################################

check_spit_status = proc{
	action = proc { |server_string|
		if server_string =~ /.*WTRICK.*SPIT.*|Example\:.*WTRICK SPIT SECOND LESSER ORC LEFT FOOT|Locations\:.*SHIRT.*\-0 difficulty|.*FEET.*\-10|LEFT\/RIGHT FOOT.*\-30|.*LEFT\/RIGHT HAND.*\-50 to \-75 \(held objects\)|.*FACE.*\-80|.*LEFT\/RIGHT EYE.*\-130/
			nil
		elsif server_string =~ /^\s+$/
			nil
		elsif server_string =~ /\-25 penalty to targets not in your group\./
			spit_status = "good"
			DownstreamHook.remove("#{script.name}_check_spit_status")
			nil
		elsif server_string =~ /Your mouth is too dry at the moment\./
			spit_status = "bad"
			DownstreamHook.remove("#{script.name}_check_spit_status")
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_spit_status", action)
		wait_rt.call
		sleep 0.1
		waitrt?
		spit_status = nil
		silence_me
		fput "wtrick spit"
		silence_me
		wait_until { spit_status }
}

do_guild_chores = proc{
	current_task = nil
	rooms_not_to_do = Array.new
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild cleaning supplies') }
	go_to.call
	if Room.current.id == 17787
		$first_guild = 17787 unless $first_guild
	elsif Room.current.id == 16991
		$first_guild = 16991 unless $first_guild
	elsif Room.current.id == 17039
		$first_guild = 17039 unless $first_guild
	end
	if checkright =~ /rake|bag|brush|shear|rag/
		fput "put my #{checkright} in rack"
	end
	if checkleft =~ /rake|bag|brush|shear|rag/
		fput "put my #{checkleft} in rack"
	end
	store_backsheath
	stow_all.call
	if main_task =~ /polish/i
		fput "get rag from rack"
	elsif main_task =~ /scrub/i
		fput "get brush from rack"
	elsif main_task =~ /prune/i
		fput "get shears from rack"
	end
	stand_up.call
	move 'out' if checkpaths 'out'
	if main_task =~ /prune/i
		target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild shrubbery') && !rooms_not_to_do.include?(room.id) }
	elsif main_task =~ /polish/i
		target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild armor') && !rooms_not_to_do.include?(room.id) }
	elsif main_task =~ /scrub/i
		target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild floor') && !rooms_not_to_do.include?(room.id) }
	end
	loop{
		break if current_task == "finished" || current_task == "next guild" || current_task == "waiting 15 minutes"
		go_to.call
		wait_rt.call
		if main_task =~ /prune|polish/i
			GameObj.loot.each { |item|
				break if current_task == "finished"
				if (item.noun =~ shrubbery_names) || (item.noun =~ /armor/i)
					wait_rt.call
					if main_task =~ /prune/i
						fput "prune ##{item.id}"
					elsif main_task =~ /polish/i
						fput "rub ##{item.id}"
					end
					wait_rt.call
					while line = get
						if line =~ /\[You have \d+ repetition\(s\) remaining for this .* task\.\]|That\'s enough .*\, let someone else have a crack at it\./
							break
						elsif line =~/\[You have completed this .* task\.\]|You have already finished that task\./
							current_task = "finished"
							break
						end
					end
				end
			}
			GameObj.room_desc.each { |item|
				break if current_task == "finished"
				if (item.noun =~ shrubbery_names) || (item.noun =~ /armor/i)
					wait_rt.call
					if main_task =~ /prune/i
						fput "prune ##{item.id}"
					elsif main_task =~ /polish/i
						fput "rub ##{item.id}"
					end
					wait_rt.call
					while line = get
						if line =~ /\[You have \d+ repetition\(s\) remaining for this .* task\.\]|That\'s enough .*\, let someone else have a crack at it\./
							break
						elsif line =~/\[You have completed this .* task\.\]|You have already finished that task\./
							current_task = "finished" 
							break
						end
					end
				end
			}
		elsif main_task =~ /scrub/i
			until kneeling?
				wait_rt.call
				fput "kneel"
				sleep 0.1
			end
			wait_rt.call
			fput "clean floor"
			while line = get
				if line =~ /\[You have \d+ repetition\(s\) remaining for this .* task\.\]|That\'s enough .* for this .*\, let someone else have a crack at it\.|What were you referring to\?/
					break
				elsif line =~/\[You have completed this .* task\.\]|You have already finished that task\./
					current_task = "finished" 
					break
				end
			end
		end
		wait_rt.call
		stand_up.call
		rooms_not_to_do.push(target_room)
		stand_up.call
		move 'out' if checkpaths 'out'
		if main_task =~ /prune/i
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild shrubbery') && !rooms_not_to_do.include?(room.id) }
		elsif main_task =~ /polish/i
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild armor') && !rooms_not_to_do.include?(room.id) }
		elsif main_task =~ /scrub/i
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild floor') && !rooms_not_to_do.include?(room.id) }
		end
		target_room = Room.current.find_nearest(target_room_list)
		if Room.current.path_to(target_room).length > 20 && current_task != "finished"
			if UserVars.warrior["do_work_in_other_guilds"] == "yes"
				current_task = "next guild"
			else
				message_string = "Waiting 15 minutes to continue working on this task. Set Do Work In Other Guilds to YES in setup for script to automatically finish these tasks in nearby guilds."
				display_message.call
				sleep 900
				current_task = "waiting 15 minutes"
			end
		end
		sleep 0.1
	}
	if current_task == "next guild"
		go_to_next_guild.call
	elsif current_task == "finished"
		put_tools_away.call
		go_back_to_first_guild.call
		turn_in_task.call
	elsif current_task == "waiting 15 minutes"
		current_skill_start.call
	end
}

check_gld_stance = proc{
	action = proc { |server_string|
		if server_string =~ /For more information on .*GLD STANCE.*\, type .*GLD STANCE HELP.*\./
			nil
		elsif server_string =~ /You are currently using your guild skills to their fullest\!/
			guild_stance = "offensive"
			DownstreamHook.remove("#{script.name}_check_gld_stance")
			nil
		elsif server_string =~ /Your current guild stance is advancing\./
			guild_stance = "advance"
			DownstreamHook.remove("#{script.name}_check_gld_stance")
			nil
		elsif server_string =~ /Your current guild stance is forward\./
			guild_stance = "forward"
			DownstreamHook.remove("#{script.name}_check_gld_stance")
			nil
		elsif server_string =~ /Your current guild stance is neutral\./
			guild_stance = "neutral"
			DownstreamHook.remove("#{script.name}_check_gld_stance")
			nil
		elsif server_string =~ /Your current guild stance is guarded\./
			guild_stance = "guarded"
			DownstreamHook.remove("#{script.name}_check_gld_stance")
			nil
		elsif server_string =~ /Your current guild stance is defensive\./
			guild_stance = "defensive"
			DownstreamHook.remove("#{script.name}_check_gld_stance")
			nil
		elsif server_string =~ /^\s+$/
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_gld_stance", action)
		guild_stance = nil
		waitrt?
		silence_me
		put "gld stance"
		silence_me
		wait_until { guild_stance }
		if (needed_gld_stance != guild_stance) && (main_task != "Warrior Tricks: #{current_trick} Audience")
			wait_until { !stunned? && !webbed? && !Spell[214].active? }
			waitrt?
			put "gld stance #{needed_gld_stance}"
		end
}

wait_for_partner_confirmation = proc{
	echo "Waiting for confirmation from partner. Type NOD to skip the wait for confirmation."
	result = dothistimeout "#{partner_question_to_ask}", 10, /^(#{my_partner} whispers\, \"I am ready\.\"|You nod\.)$/
	if result =~ /^(#{my_partner} whispers\, \"I am ready\.\"|You nod\.)$/
		nil
	elsif result.nil?
		echo "Partner did not respond, asking again."
		wait_for_partner_confirmation.call
	end
}

stance_offensive = proc{
	until checkstance == "offensive"
		wait_rt.call
		fput "stance offensive"
		sleep 0.1
	end
}

stow_right = proc{
	status_tags
	until checkright == nil
		wait_rt.call
		result = dothistimeout "stow right", 3, /You can\'t put .*in.*exist\=\"(\d+)\"\s+noun\=.*It\'s closed\!|You put|You return/
		if result =~ /You can\'t put .*in.*exist\=\"(\d+)\"\s+noun\=.*It\'s closed\!/
			fput "open ##{$1}"
		elsif result =~ /You put|You return/
			nil
		elsif result.nil?
			fput "open ##{$1}"
		end
		fput "stow right"
		sleep 0.1
	end
	status_tags
}

stow_left = proc{
	status_tags
	until checkleft == nil
		wait_rt.call
		result = dothistimeout "stow left", 3, /You can\'t put .*in.*exist\=\"(\d+)\"\s+noun\=.*It\'s closed\!|You put|You return/
		if result =~ /You can\'t put .*in.*exist\=\"(\d+)\"\s+noun\=.*It\'s closed\!/
			fput "open ##{$1}"
		elsif result =~ /You put|You return/
			nil
		elsif result.nil?
			fput "open ##{$1}"
		end
		fput "stow left"
		sleep 0.1
	end
	status_tags
}

stow_all = proc{
	stow_right.call
	stow_left.call
}

go_to_partner_room = proc{
	if script.vars[3] != nil
		start_script "go2", [script.vars[3]]
		wait_while{ running?('go2') }
	end
}

check_for_weapons = proc {
	action = proc { |server_string|
		if server_string =~ /\s{6}.*(an?|the|some) |\s{2}.*(an?|the|some) |^You are currently wearing and carrying\:/
			if (server_string =~ /[\s{6}.*[an?|the|some]|\s{2}.*[an?|the|some]].*exist\=\"(.*)\"\s+noun\=\"(.*)\</)
				temp_weapon = $1
				if $2 =~ weapon_type_to_check
					current_disarm_others_weapon = temp_weapon if (main_task == "Disarm Weapon: Disarm Critters (#{practice_disarm_weapon_type} weapon)") || (main_task == "Disarm Weapon: Disarm Partner (#{practice_disarm_weapon_type} weapon)")
					tricks_weapon = temp_weapon if (current_skill_name == "Warrior Tricks")
				end
			end
			nil
		elsif server_string =~ /^\s+$/
			nil
		elsif server_string =~ /^\(\d+ items? displayed\.\)/
			DownstreamHook.remove("#{script.name}_check_for_weapons")
			done_checking_weapons = true
			nil
		else
			server_string
		end
	}
		DownstreamHook.add("#{script.name}_check_for_weapons", action)
		done_checking_weapons = nil
		current_disarm_others_weapon = nil
		tricks_weapon = nil
		if current_skill_name == "Disarm Weapon"
			if practice_disarm_weapon_type =~ /blunt/
				weapon_type_to_check = blunt_weapons
			elsif practice_disarm_weapon_type =~ /brawling/
				weapon_type_to_check = brawling_weapons
			elsif practice_disarm_weapon_type =~ /edged/
				weapon_type_to_check = edged_weapons
			elsif practice_disarm_weapon_type =~ /polearm/
				weapon_type_to_check = polearm_weapons
			elsif practice_disarm_weapon_type =~ /twohanded/
				weapon_type_to_check = twohanded_weapons
			end
		elsif current_skill_name == "Warrior Tricks"
			if trick_to_perform =~ /wflip|tsheath|spin|balance|initial|juggle|tslice|ksheath/i
				weapon_type_to_check = edged_weapons
			elsif trick_to_perform =~ /backflip|whop/i
				weapon_type_to_check = large_weapons
			end
		end
		temp_weapon = nil
		silence_me
		fput "inv full"
		silence_me
		wait_until { done_checking_weapons }
}

wait_rt = proc{
	waitrt?
	wait_until { !stunned? && !webbed? && !Spell[214].active? }
}

stance_defensive = proc{
	until checkstance == "defensive"
		wait_rt.call
		fput "stance defensive"
		sleep 0.1
	end
}

stand_up = proc{
	until standing?
		wait_rt.call
		fput "stand"
		sleep 0.1
	end
}

rake_leaves = proc{
	rooms_not_to_do = Array.new
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild cleaning supplies') }
	go_to.call
	if checkleft =~ /rake/ || checkright =~ /rake/
		fput "put rake in rack"
	end
	if checkleft =~ /bag/ || checkright =~ /bag/
		fput "put bag in rack"
	end
	store_backsheath
	stow_all.call
	fput "get rake from rack"
	fput "get bag from rack"
	fput "put my bag in bin"
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild leaves') && !rooms_not_to_do.include?(room.id) }
	loop{
		break if current_task == "finished"
		leaf_bag_full = nil
		go_to.call
		GameObj.loot.find{ |item|
			if item.name =~ /leaves/
				while item.status !~ /gone/
					wait_rt.call
					fput "pull my rake"
				end
			end
		}
		GameObj.loot.find{ |item|
			if item.name =~ /pile/
				wait_rt.call
				fput "get pile"
			end
		}
		check_leaf_bag_status.call
		if leaf_bag_full == "yes"
			empty_leaves_in_bin.call
		else
			rooms_not_to_do.push(target_room)
			stand_up.call
			move 'out' if checkpaths 'out'
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild leaves') && !rooms_not_to_do.include?(room.id) }
			target_room = Room.current.find_nearest(target_room_list)
			if Room.current.path_to(target_room).length > 20
				empty_leaves_in_bin.call
			end
		end
	}
	put_tools_away.call
	turn_in_task.call	
}

empty_leaves_in_bin = proc{
	stand_up.call
	move 'out' if checkpaths 'out'
	target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild cleaning supplies') }
	go_to.call
	fput "put my bag in bin"
	while line = get
		if line =~ /\[You have \d+ repetition\(s\) remaining for this .* task\.]|Your burlap bag isn\'t full yet\./
			rooms_not_to_do = Array.new
			stand_up.call
			move 'out' if checkpaths 'out'
			target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild leaves') && !rooms_not_to_do.include?(room.id) }
			break
		elsif line =~ /^\[You have completed this .* task\.\]/
			current_task = "finished"
			break
		end
	end
}

go_to_next_guild = proc{
	if $first_guild == 17787
		first_guild_town_name = "Icemule Trace"
	elsif $first_guild == 16991
		first_guild_town_name = "Wehnimer's Landing"
	elsif $first_guild == 17039
		first_guild_town_name = "Solhaven"
	end
	put_tools_away.call
	store_backsheath
	stow_all.call
	fput "get my #{UserVars.warrior["weapon"]}" if UserVars.warrior["weapon"] != "nil" && UserVars.warrior["weapon"] != nil && UserVars.warrior["weapon"] != ""
	fput "get my #{UserVars.warrior["offhand"]}" if UserVars.warrior["offhand"] != "nil" && UserVars.warrior["offhand"] != nil && UserVars.warrior["offhand"] != ""
	if $first_guild == 17787
		if Room.current.id == 17787
			next_guild_room_number = 16991
		elsif (Room.current.id == 16991) && (main_task =~ /scrub|polish/i)
			next_guild_room_number = 9999999999
		elsif Room.current.id == 16991
			next_guild_room_number = 17039
		elsif Room.current.id == 17039
			next_guild_room_number = 9999999999
		end
	elsif $first_guild == 16991
		if (Room.current.id == 16991) && (main_task =~ /scrub|polish/i)
			next_guild_room_number = 17787
		elsif Room.current.id == 16991
			next_guild_room_number = 17039
		elsif Room.current.id == 17039
			next_guild_room_number = 17787
		elsif Room.current.id == 17787
			next_guild_room_number = 9999999999
		end
	elsif $first_guild == 17039
		if Room.current.id == 17039
			next_guild_room_number = 16991
		elsif Room.current.id == 16991
			next_guild_room_number = 17787
		elsif Room.current.id == 17787
			next_guild_room_number = 9999999999
		end
	else
		echo "This feature only works in the following guilds: Icemule, Landing, Solhaven."
		exit
	end
	if next_guild_room_number == 17787
		next_guild_town_name = "Icemule Trace"
	elsif next_guild_room_number == 16991
		next_guild_town_name = "Wehnimer's Landing"
	elsif next_guild_room_number == 17039
		next_guild_town_name = "Solhaven"
	end
	if next_guild_room_number == 9999999999
		wait_before_doing_more_guild_tasks.call
	else
		message_string = "Heading to #{next_guild_town_name} to continue working on this task. Your starting town is #{first_guild_town_name} and you will return to this town when finished."
		display_message.call
		start_script "go2", [next_guild_room_number]
		wait_while{ running?('go2') }
		current_skill_start.call
	end
}

go_back_to_first_guild = proc{
	if Room.current.id != $first_guild
		store_backsheath
		stow_all.call
		fput "get my #{UserVars.warrior["weapon"]}" if UserVars.warrior["weapon"] != "nil" && UserVars.warrior["weapon"] != nil && UserVars.warrior["offhand"] != ""
		fput "get my #{UserVars.warrior["offhand"]}" if UserVars.warrior["offhand"] != "nil" && UserVars.warrior["offhand"] != nil && UserVars.warrior["offhand"] != ""
		message_string = "Returning to #{first_guild_town_name} to turn in task."
		display_message.call
		start_script "go2", [$first_guild]
		wait_while{ running?('go2') }
	end
}

wait_before_doing_more_guild_tasks = proc{
	message_string = "Returning to your starting town of #{first_guild_town_name}."
	display_message.call
	start_script "go2", [$first_guild]
	wait_while{ running?('go2') }
	message_string = "Could not finish current task. Waiting 5 minutes and starting again."
	display_message.call
	sleep 300
	current_skill_start.call
}

put_tools_away = proc{
	if checkleft =~ /rake|bag|brush|shear|rag/ || checkright =~ /rake|bag|brush|shear|rag/
		message_string = "Putting tools away in the guild rack."
		display_message.call
		stand_up.call
		move 'out' if checkpaths 'out'
		target_room_list = Map.list.find_all { |room| room.tags.include?('warrior guild cleaning supplies') }
		go_to.call
		if checkleft =~ /rake|bag|brush|shear|rag/
			fput "put #{checkleft} in rack"
		end
		if checkright =~ /rake|bag|brush|shear|rag/
			fput "put #{checkright} in rack"
		end
	end
}

#########################################
##############Partner Tasks##############
#########################################

attack_partner_tasks = proc{
	if (script.vars[2] == nil) || (do_not_do_next_parter_task)
		message_string = "This task requires a partner. Type ;warrior help for information on how to use script for partner reps."
		display_message.call
		exit
	end
	store_backsheath
	stow_all.call
	if current_skill_name == "Disarm Weapon"
	#	check_for_weapons.call
	#	if current_disarm_others_weapon
	#		fput "get ##{current_disarm_others_weapon}"
	#	else
	#		this_room = Room.current.id
	#		buy_needed_weapon.call
	#		start_script 'go2', [ this_room ]
	#		wait_while { running?('go2') }
	#	end
		fput "get my #{UserVars.warrior["main_disarm_weapon"]}"
	end
	go_to_partner_room.call
	message_string = "Waiting for partner."
	display_message.call
	wait_for_my_partner.call
	needed_gld_stance = "offensive"
	check_gld_stance.call
	stance_offensive.call
	if current_skill_name == "Disarm Weapon"
		partner_question_to_ask = "whisper #{my_partner} Can I disarm you?"
	elsif current_skill_name == "Tackle"
		partner_question_to_ask = "whisper #{my_partner} Can I tackle you?"
	end
	wait_for_partner_confirmation.call
	loop{
		wait_rt.call
		stand_up.call
		
		if checkhealth < 60
			if UserVars.warrior["low_health_script"] == "nil"
				message_string = "Waiting for health."
				display_message.call
				wait_until { checkhealth >= 70 }
			else
				message_string = "Running low health script."
				display_message.call
				kill_script "#{UserVars.warrior["low_health_script"]}" if running? "#{UserVars.warrior["low_health_script"]}"
				wait_until { !running? "#{UserVars.warrior["low_health_script"]}" }
				start_script "#{UserVars.warrior["low_health_script"]}"
				wait_while { running? "#{UserVars.warrior["low_health_script"]}" }
				go_to.call				
			end
		end

		break if current_task == "finished"
		wait_for_stamina.call
		waitrt?
		if current_skill_name == "Disarm Weapon"
			fput "disarm #{my_partner}"
		elsif current_skill_name == "Tackle"
			fput "tackle #{my_partner}"
		end
		while line = get
			if line =~ /is not holding a weapon/
				fput "whisper #{my_partner} Again please."
				while line = get
					if (line =~ /#{my_partner} (removes|picks up)/) || (line =~ /An? .* rises from the floor and flies back to .*\'s waiting hand\!/)
						break
					end
				end
				break
			elsif line =~ /.* is already prone\, how much flatter do you want (him|her) to be\?/
				fput "whisper #{my_partner} Again please."
				GameObj.pcs.each { |pc|
					if pc.name =~ /#{my_partner}/
						until pc.status !~ /prone|lay|lie|lying/
							wait_rt.call
							fput "pull #{my_partner}"
							sleep 0.1
						end
					end
				}
				break
			elsif line =~ /Roundtime\:|Round time\:|\[You have \d+ repetition\(s\) remaining\.\]|\.\.\.wait \d+ seconds\.|You might want to stand up first\.|You haven\'t learned how to disarm without a weapon\!/
				fput "get ##{current_disarm_others_weapon}" if line =~ /You haven\'t learned how to disarm without a weapon\!/
				break
			elsif line =~ /\[You have completed your training task\.\]/
				current_task = "finished"
				fput "whisper #{my_partner} All finished. Thank you!"
				break
			end
			
		end
		sleep 0.1
	}
	if script.vars[3] == nil
		do_not_do_next_parter_task = true
	end
	turn_in_task.call
}

be_attacked_by_partner_tasks = proc{
	current_task = nil
	if (script.vars[2] == nil) || (do_not_do_next_parter_task)
		message_string = "This task requires a partner. Type ;warrior help for information on how to use script for partner reps."
		display_message.call
		exit
	end
	store_backsheath
	stow_all.call
	if current_skill_name == "Disarm Weapon"
	#	if practice_disarm_weapon_type =~ /blunt/
	#		current_be_disarmed_weapon = $current_blunt_be_disarmed_weapon
	#	elsif practice_disarm_weapon_type =~ /brawling/
	#		current_be_disarmed_weapon = $current_brawling_be_disarmed_weapon
	#	elsif practice_disarm_weapon_type =~ /edged/
	#		current_be_disarmed_weapon = $current_edged_be_disarmed_weapon
	#	elsif practice_disarm_weapon_type =~ /polearm/
	#		current_be_disarmed_weapon = $current_polearm_be_disarmed_weapon
	#	elsif practice_disarm_weapon_type =~ /twohanded/
	#		current_be_disarmed_weapon = $current_twohanded_be_disarmed_weapon
	#	end
	#	wait_rt.call
	#	if current_be_disarmed_weapon
	#		result = dothistimeout "get ##{current_be_disarmed_weapon}", 3, /You remove|Get what\?/
	#		if result =~ /You remove/
	#			nil
	#		elsif result =~ /Get what\?/
	#			current_be_disarmed_weapon = nil
	#		elsif result.nil?
	#			current_be_disarmed_weapon = nil
	#		end
	#	end
	#	if current_be_disarmed_weapon == nil
	#		this_room = Room.current.id
	#		buy_needed_weapon.call
	#		start_script 'go2', [ this_room ]
	#		wait_while { running?('go2') }
	#	end
		wait_rt.call
		until checkright != nil
			waitrt?
			sleep 0.1
			fput "get my #{UserVars.warrior["main_disarm_weapon"]}"
		end
		wait_until { checkright != nil }
		current_be_disarmed_weapon = GameObj.right_hand.id
	end
	go_to_partner_room.call
	message_string = "Waiting for partner."
	display_message.call
	wait_for_my_partner.call
	if current_skill_name == "War Cries"
		needed_gld_stance = "offensive"
	else
		needed_gld_stance = "defensive"
	end
	check_gld_stance.call
	stance_offensive.call
	if current_skill_name == "Disarm Weapon"
		partner_question_to_ask = "whisper #{my_partner} Can you disarm me?"
	elsif current_skill_name == "Tackle"
		partner_question_to_ask = "whisper #{my_partner} Can you tackle me?"
	elsif current_skill_name == "War Cries"
		partner_question_to_ask = "whisper #{my_partner} Can you teach me warcries?"
	end
	wait_for_partner_confirmation.call
	if current_skill_name == "War Cries"
		while line = get
			if line =~ /#{my_partner} pulls you aside and demonstrates how .* (Bellow|Yowlp|Growl|Shout|Cry|Holler) is done\./
				warcry_to_perform = $1
				break
			elsif line =~ /#{my_partner} whispers\, \"Sorry I am unable to teach you\. You either have more skill ranks than I do or you have the same amount but are a higher level\.\"/
				echo "Your partner couldn't teach you War Cries because you either have more ranks or have the same number of ranks but are a higher level."
				exit
			end
		end
	end
	sleep 0.5
	if current_skill_name == "War Cries"
		warcry_count = 0
		loop{
			break if (current_task == "finished") || (current_task == "start over again")
			waitrt?
			fput "warcry #{warcry_to_perform}"
			while line = get
				if line =~ /\[You have \d+ repetition\(s\) remaining\.\]|Roundtime/
					break
				elsif line =~ /You need to give your vocal cords a bit of a rest\!/
					fput "whisper #{my_partner} I need to give my throat a rest."
					echo "Need to give throat a rest. Starting again in 120 seconds."
					sleep 120
					current_task = "start over again"
					break
				elsif line =~ /\[You have completed your training task\.\]/
					current_task = "finished"
					fput "whisper #{my_partner} All finished. Thank you!"
					break
				end
			end
			if (current_task != "finished") && (current_task != "start over again")
				echo "Waiting 10 seconds so I don't wear out my throat."
				sleep 10
				warcry_count += 1
				if warcry_count > 9
					fput "whisper #{my_partner} I need another lesson please."
					warcry_count = 0
					sleep 2
				end
			end
			
		}
	else
		loop{
			if current_skill_name == "Disarm Weapon"
				until checkright != nil
					wait_rt.call
					fput "get ##{current_be_disarmed_weapon}"
					sleep 0.1
				end
			end
			break if current_task == "finished"
			fput "whisper #{my_partner} Again please."
			while line = get
				if line =~ /\[You have \d+ repetition\(s\) remaining\.\]|fails to connect|.* hurls .* at you\,/
					break
				elsif line =~ /\[You have completed your training task\.\]/
					current_task = "finished"
					fput "whisper #{my_partner} All finished. Thank you!"
					break
				end
			end
			sleep 0.1
		}
	end
	if current_skill_name == "Disarm Weapon"
		until checkright != nil
			wait_rt.call
			fput "get ##{current_be_disarmed_weapon}"
			sleep 0.1
		end
	end
	if (current_task == "start over again")
		be_attacked_by_partner_tasks.call
	else
		if script.vars[3] == nil
			do_not_do_next_parter_task = true
		end
		turn_in_task.call
	end
}

help_with_partner_tasks_start = proc{
	message_string = "Waiting for a partner."
	display_message.call
	while line = get
		if (line =~ /^([a-zA-Z]+) whispers\, \"Can (I|you) (disarm|tackle) (you|me)\?\"/) || (line =~ /^([a-zA-Z]+) whispers\, \"Can (I|you) teach (you|me) (warcries)\?\"/)
			if (line =~ /^([a-zA-Z]+) whispers\, \"Can (I|you) (disarm|tackle) (you|me)\?\"/)
				my_partner = $1
				my_partner_task = $3
				my_partner_task_me_or_you = $4
			elsif (line =~ /^([a-zA-Z]+) whispers\, \"Can (I|you) teach (you|me) (warcries)\?\"/)
				my_partner = $1
				my_partner_task = $4
				my_partner_task_me_or_you = $3
			end
			if script.vars[2] != nil
				if line !~ /#{script.vars[2]}/i
					my_partner = nil
				end
			end
			if my_partner != nil
				if my_partner_task_me_or_you == "you"
					help_with_partner_tasks_be_attacked.call
				elsif my_partner_task_me_or_you == "me"
					help_with_partner_tasks_attack_partner.call
				end
			end
		elsif (line =~ /^([a-zA-Z]+) whispers\, \"Can you promote me in (.*)\?\"/)
			my_partner = $1
			my_partner_task = $2
			fput "gld promote #{my_partner} in disarm" if my_partner_task =~ /Disarm Weapon/i
			fput "gld promote #{my_partner} in berserk" if my_partner_task =~ /Berserk/i
			fput "gld promote #{my_partner} in tricks" if my_partner_task =~ /Warrior Tricks/i
			fput "gld promote #{my_partner} in tackle" if my_partner_task =~ /Tackle/i
			fput "gld promote #{my_partner} in warcries" if my_partner_task =~ /War Cries/i
			fput "gld promote #{my_partner} in batter" if my_partner_task =~ /Batter Barriers/i
			while line = get
				if line =~ /.* isn\'t part of your guild\!/
					fput "whisper #{my_partner} Sorry, you don't appear to be a warrior."
					break
				elsif line =~ /.* is behind in .* dues\!  You\'ll have to check .* in first\./
					fput "whisper #{my_partner} Sorry, you appear to be behind in your dues and I am unable to promote you."
					break
				elsif line =~ /.* hasn\'t earned enough training points to be promoted\!/
					fput "whisper #{my_partner} Sorry, you need to earn more training points to be promoted."
					break
				elsif line =~ /You promote .* to .* next rank of .*\./
					fput "whisper #{my_partner} Congratulations!"
					break
				end
			end
		end
	end
}

help_with_partner_tasks_be_attacked = proc{
	store_backsheath
	stow_all.call
	if my_partner_task == "disarm"
		until checkright != nil
			wait_rt.call
			fput "get my #{UserVars.warrior["main_disarm_weapon"]}"
			sleep 0.1
		end
		current_be_disarmed_weapon = GameObj.right_hand.id
	end
	needed_gld_stance = "defensive"
	check_gld_stance.call
	stance_offensive.call
	fput "whisper #{my_partner} I am ready."
	while line = get
		if line =~ /^#{my_partner} whispers\, \"Again please\.\"|^#{my_partner} whispers\, "All finished\. Thank you\!\"/
			if my_partner_task == "disarm"
				until checkright != nil
					wait_rt.call
					fput "get ##{current_be_disarmed_weapon}"
					sleep 0.1
				end
			end
			break if line =~ /^#{my_partner} whispers\, "All finished\. Thank you\!\"/
		end
		
	end
	stand_up.call
	message_string = "Waiting for a partner."
	display_message.call
}

help_with_partner_tasks_attack_partner = proc{
	store_backsheath
	stow_all.call
	wait_until { checkright == nil }
	if my_partner_task == "disarm"
		until checkright != nil
			wait_rt.call
			fput "get my #{UserVars.warrior["main_disarm_weapon"]}"
			sleep 0.1
		end
		current_be_disarmed_weapon = GameObj.right_hand.id
	end
	wait_rt.call
	needed_gld_stance = "offensive"
	check_gld_stance.call
	stance_offensive.call
	fput "whisper #{my_partner} I am ready."
	if my_partner_task == "warcries"
		fput "warcry teach #{my_partner}"
		while line = get
			if line =~ /#{my_partner} whispers\, "All finished\. Thank you\!\"|#{my_partner} whispers\, \"I need to give my throat a rest\.\"/
				break
			elsif line =~ /#{my_partner} whispers\, "I need another lesson please\.\"/
				fput "warcry teach #{my_partner}"
			elsif line =~ /#{my_partner} is busy concentrating on someone else\'s lessons at the moment\./
				fput "whisper #{my_partner} You are currently already learning. Waiting 15 seconds and trying again."
				sleep 15
				current_task = "start again"
				break
			elsif line =~ /You don\'t know enough about war cries to be much of a teacher to .*\./
				fput "whisper #{my_partner} Sorry I am unable to teach you. You either have more skill ranks than I do or you have the same amount but are a higher level."
				break
			end
		end
	else
		while line = get
			if line =~ /^#{my_partner} whispers\, \"Again please\.\"/
				wait_rt.call
				stand_up.call
				if current_skill_name == "Disarm Weapon"
					fput "get ##{current_be_disarmed_weapon}" if checkright == nil
				end
				if my_partner_task == "tackle"
					GameObj.pcs.each { |pc|
						if pc.name =~ /#{my_partner}/
							until pc.status !~ /prone|lay|lie|lying/
								wait_rt.call
								fput "pull #{my_partner}"
								sleep 0.1
							end
						end
					}
				end
				wait_for_stamina.call
				waitrt?
				if my_partner_task == "disarm"
					fput "disarm #{my_partner}"
				elsif my_partner_task == "tackle"
					fput "tackle #{my_partner}"
				end
			elsif line =~ /^#{my_partner} whispers\, "All finished\. Thank you\!\"/
				break
			end	
		end
	end
	if current_skill_name == "Disarm Weapon"
		until checkright != nil
			wait_rt.call
			fput "get ##{current_be_disarmed_weapon}"
			sleep 0.1
		end
	end
	stand_up.call
	if current_task == "start again"
		help_with_partner_tasks_attack_partner.call
	else
		message_string = "Waiting for a partner."
		display_message.call
	end
}

wait_for_my_partner = proc{
	my_partner = nil
	if UserVars.warrior["lnet_message_partner"] == "yes"
		LNet.send_message(h={'to'=>"#{script.vars[2]}", 'type'=>'private'}, "I need your help with a warrior guild task.")
	end
	loop{
		break if my_partner
		GameObj.pcs.each{ |pc|
			if pc.noun =~ /#{script.vars[2]}/i
				my_partner = pc.noun
			end
		}
		sleep 1
	}
}

#########################################
##################Begin##################
#########################################

if script.vars[1] =~ /help/
	help_screen.call
	exit
end

if Char.prof != 'Warrior'
	echo "This script only works for warriors."
	exit
end

if UserVars.warrior == nil && script.vars[1] !~ /setup/
	respond "Setup needs to be run. Type ;warrior setup"
	exit
end

if script.vars[1] =~ /setup/
	setup.call
	exit
end

if script.vars[1] =~ /checkin/
	check_in_with_guild_master.call
	exit
end

before_dying {
	if !dead?
		wait_rt.call
		put_tools_away.call
		fput "stow right" if checkright != nil
		fput "stow left" if checkleft != nil
		if current_be_disarmed_weapon
			fput "get ##{current_be_disarmed_weapon}"
			wait_until { checkright }
			echo "I purchased this #{checkright} while doing guild tasks."
		end
		if tricks_weapon
			if checkright == nil
				fput "get ##{tricks_weapon}"
				wait_until { checkright }
				echo "I purchased this #{checkright} while doing guild tasks."
			else
				fput "get ##{tricks_weapon}"
				wait_until { checkleft }
				echo "I purchased this #{checkleft} while doing guild tasks."
			end
		end
	end
}

store_backsheath {
	fput "put morning-star in my back-sheath"
	fput "put star in my back-sheath"
}

if script.vars[1] =~ /bat|ber|dis|tac|cri|tri/
	check_guild_status.call
end
if script.vars[1] !~ /bat|ber|dis|tac|cri|tri|part/
	respond "Please enter an appropriate command. Type ;warrior help for usage information."
	exit
end

if script.vars[1] =~ /part/
	help_with_partner_tasks_start.call
else
	put_tools_away.call
	current_skill_start.call
end