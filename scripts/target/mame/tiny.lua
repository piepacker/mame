-- license:BSD-3-Clause
-- copyright-holders:MAMEdev Team

---------------------------------------------------------------------------
--
--   tiny.lua
--
--   Small driver-specific example makefile
--   Use make SUBTARGET=tiny to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["Z80"] = true
CPUS["M680X0"] = true
CPUS["MCS51"] = true
CPUS["TMS340X0"] = true
CPUS["SE3208"] = true
CPUS["PIC16C5X"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["YM2610"] = true
SOUNDS["GAELCO_CG1V"] = true
SOUNDS["GAELCO_GAE1"] = true
SOUNDS["OKIM6295"] = true
SOUNDS["VRENDER0"] = true
SOUNDS["SEGAPCM"] = true
SOUNDS["YM2151"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["BUFSPRITE"] = true
VIDEOS["TLC34076"] = true
VIDEOS["VRENDER0"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["GEN_LATCH"] = true
MACHINES["INPUT_MERGER"] = true
MACHINES["WATCHDOG"] = true
MACHINES["Z80DAISY"] = true
MACHINES["UPD1990A"] = true
MACHINES["DS1302"] = true
MACHINES["VRENDER0"] = true
MACHINES["EEPROMDEV"] = true
MACHINES["ALPHA_8921"] = true
MACHINES["68681"] = true
MACHINES["ADC0804"] = true
MACHINES["I8255"] = true
MACHINES["TICKET"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--BUSES["CENTRONICS"] = true
BUSES["NEOGEO"] = true
BUSES["NEOGEO_CTRL"] = true

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in tiny.lst
--------------------------------------------------

function createProjects_mame_tiny(_target, _subtarget)
	project ("mame_tiny")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-tiny"))
	addprojectflags()
	precompiledheaders_novs()

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices",
		MAME_DIR .. "src/mame/shared",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		GEN_DIR  .. "mame/layout",
	}

	files{
			MAME_DIR .. "src/mame/drivers/neogeo.cpp",
			MAME_DIR .. "src/mame/includes/neogeo.h",
			MAME_DIR .. "src/mame/video/neogeo.cpp",
			MAME_DIR .. "src/mame/drivers/neopcb.cpp",
			MAME_DIR .. "src/mame/video/neogeo_spr.cpp",
			MAME_DIR .. "src/mame/video/neogeo_spr.h",
			MAME_DIR .. "src/mame/machine/ng_memcard.cpp",
			MAME_DIR .. "src/mame/machine/ng_memcard.h",

			-- aligatoruna
			MAME_DIR .. "src/mame/drivers/gaelco2.cpp",
			MAME_DIR .. "src/mame/includes/gaelco2.h",
			MAME_DIR .. "src/mame/machine/gaelco2.cpp",
			MAME_DIR .. "src/mame/video/gaelco2.cpp",
			MAME_DIR .. "src/mame/machine/gaelco_ds5002fp.cpp",
			MAME_DIR .. "src/mame/machine/gaelco_ds5002fp.h",

		-- for ultennis
		MAME_DIR .. "src/mame/drivers/artmagic.cpp",
		MAME_DIR .. "src/mame/includes/artmagic.h",
		MAME_DIR .. "src/mame/video/artmagic.cpp",

			-- evosocc
			MAME_DIR .. "src/mame/drivers/crystal.cpp",

		-- sharrier
		MAME_DIR .. "src/mame/drivers/segahang.cpp",
		MAME_DIR .. "src/mame/includes/segahang.h",
		MAME_DIR .. "src/mame/video/segahang.cpp",
		MAME_DIR .. "src/mame/machine/fd1089.cpp",
		MAME_DIR .. "src/mame/machine/fd1089.h",
		MAME_DIR .. "src/mame/machine/fd1094.cpp",
		MAME_DIR .. "src/mame/machine/fd1094.h",
		MAME_DIR .. "src/mame/video/segaic16.cpp",
		MAME_DIR .. "src/mame/video/segaic16.h",
		MAME_DIR .. "src/mame/video/segaic16_road.cpp",
		MAME_DIR .. "src/mame/video/segaic16_road.h",
		MAME_DIR .. "src/mame/video/sega16sp.cpp",
		MAME_DIR .. "src/mame/video/sega16sp.h",

		-- thoop2a
		MAME_DIR .. "src/mame/video/thoop2.cpp",
		MAME_DIR .. "src/mame/drivers/thoop2.cpp",

		-- hdrtimes
		MAME_DIR .. "src/mame/video/playmark.cpp",
		MAME_DIR .. "src/mame/drivers/playmark.cpp",

		-- stlforce
		MAME_DIR .. "src/mame/drivers/stlforce.cpp",
		MAME_DIR .. "src/mame/video/edevices.cpp",
	}
end

function linkProjects_mame_tiny(_target, _subtarget)
	links {
		"mame_tiny",
	}
end
