return {
  "sphamba/smear-cursor.nvim",

  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
    cursor_color = "#ff4000",
    particles_enabled = true,
    stiffness = 0.7,
    trailing_stiffness = 0.35,
    trailing_exponent = 5,
    damping = 0.6,
    gradient_exponent = 0,
    gamma = 1,
    never_draw_over_target = true, -- if you want to actually see under the cursor
    hide_target_hack = true,       -- same
    particle_spread = 2,
    particles_per_second = 1000,
    particles_per_length = 100,
    particle_max_lifetime = 800,
    particle_max_initial_velocity = 40,
    particle_velocity_from_cursor = 0.5,
    particle_damping = 0.3,
    particle_gravity = -50,
    min_distance_emit_particles = 0,
  }
}
