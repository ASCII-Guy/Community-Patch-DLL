-- Table for Growth Extra Yield Buildings
CREATE TABLE IF NOT EXISTS Building_GrowthExtraYield (
BuildingType TEXT, YieldType TEXT, Yield INTEGER
);

-- Create Era Value for Great Works creators that makes them spawn in the appropriate era.
ALTER TABLE Unit_UniqueNames ADD COLUMN 'EraType' TEXT DEFAULT NULL;

-- Create buildings that cannot have access to fresh water.

ALTER TABLE Buildings ADD COLUMN 'IsNoWater' BOOLEAN DEFAULT FALSE;

-- Create buildings that must be in the Capital

ALTER TABLE Buildings ADD COLUMN 'CapitalOnly' BOOLEAN DEFAULT FALSE;

-- Belief requires an improvement on a terrain type to grant its yield.

ALTER TABLE Beliefs ADD COLUMN 'RequiresImprovement' BOOLEAN DEFAULT FALSE;

-- Belief requires a resource (improved or not) on a terrain type to grant its yield.

ALTER TABLE Beliefs ADD COLUMN 'RequiresResource' BOOLEAN DEFAULT FALSE;

-- Give CSs defensive units at the beginning of the game.

ALTER TABLE Eras ADD COLUMN 'StartingMinorDefenseUnits' INTEGER DEFAULT 0;

-- Give CSs defensive units at the beginning of the game.

ALTER TABLE HandicapInfos ADD COLUMN 'StartingMinorDefenseUnits' INTEGER DEFAULT 0;

-- Grants additional starting happiness based on gamespeed.

ALTER TABLE GameSpeeds ADD COLUMN 'StartingHappiness' INTEGER DEFAULT 0;

-- No unhappiness from Isolation.

ALTER TABLE Traits ADD COLUMN 'NoConnectionUnhappiness' BOOLEAN DEFAULT FALSE;

-- No unhappiness from religious strife.

ALTER TABLE Traits ADD COLUMN 'IsNoReligiousStrife' BOOLEAN DEFAULT FALSE;

-- Earn a free building only in your capital as your trait. No tech requirement.

ALTER TABLE Traits ADD COLUMN 'FreeCapitalBuilding' TEXT DEFAULT NULL;

-- Combat Bonus vs Higher Pop Civilization.

ALTER TABLE Traits ADD COLUMN 'CombatBonusVsHigherPop' INTEGER DEFAULT 0;

-- Earn a set number of free buildings. Uses standard 'FreeBuilding' trait (i.e. Carthage). No tech requirement.

ALTER TABLE Traits ADD COLUMN 'NumFreeBuildings' INTEGER DEFAULT 0;

-- Adds a tech requirement to the free buildings.

ALTER TABLE Traits ADD COLUMN 'FreeBuildingPrereqTech' TEXT DEFAULT NULL;

-- Adds a tech requirement to the free capital building.

ALTER TABLE Traits ADD COLUMN 'CapitalFreeBuildingPrereqTech' TEXT DEFAULT NULL;

-- Adds a trait that lets a player conquer a city-state if they can bully it.

ALTER TABLE Traits ADD COLUMN 'BullyAnnex' BOOLEAN DEFAULT FALSE;

-- Grants a free valid promotion to a unit when it enters a type of feature (forest, marsh, etc.).

ALTER TABLE Features ADD COLUMN 'LocationUnitFreePromotion' TEXT DEFAULT NULL;

-- Grants a free valid promotion to a unit when it spawns on type of feature (forest, marsh, etc.). Generally used for barbarians.

ALTER TABLE Features ADD COLUMN 'SpawnLocationUnitFreePromotion' TEXT DEFAULT NULL;

-- Grants a free valid promotion to a unit when it spawns adjacent to a type of feature (forest, marsh, etc.). Generally used for barbarians.

ALTER TABLE Features ADD COLUMN 'AdjacentSpawnLocationUnitFreePromotion' TEXT DEFAULT NULL;

-- Grants a free valid promotion to a unit when it enters a type of terrain (grassland, plains, coast, etc.).

ALTER TABLE Terrains ADD COLUMN 'LocationUnitFreePromotion' TEXT DEFAULT NULL;

-- Grants a free valid promotion to a unit when it spawns on type of terrain (grassland, plains, coast, etc.). Generally used for barbarians.

ALTER TABLE Terrains ADD COLUMN 'SpawnLocationUnitFreePromotion' TEXT DEFAULT NULL;

-- Same as above, but for spawning adjacent to a terrain type.
ALTER TABLE Terrains ADD COLUMN 'AdjacentSpawnLocationUnitFreePromotion' TEXT DEFAULT NULL;

-- Grants a free valid promotion to a unit when it is adjacent to a type of terrain (grassland, plains, coast, etc.). Generally used for barbarians.

ALTER TABLE Terrains ADD COLUMN 'AdjacentUnitFreePromotion' TEXT DEFAULT NULL;

-- Adds ability for settlers to get free buildings when a city is founded.
ALTER TABLE Units ADD COLUMN 'FoundMid' BOOLEAN DEFAULT FALSE;

-- Adds ability for settlers to get free buildings when a city is founded.
ALTER TABLE Units ADD COLUMN 'FoundLate' BOOLEAN DEFAULT FALSE;

-- Adds minimum national population requirement for a building.
ALTER TABLE Buildings ADD COLUMN 'NationalPopRequired' INTEGER DEFAULT 0;

-- Adds minimum local population requirement for a building.
ALTER TABLE Buildings ADD COLUMN 'LocalPopRequired' INTEGER DEFAULT 0;

-- Reduces specialist unhappiness in cities by a set amount, either in capital or in all cities.
ALTER TABLE Policies ADD COLUMN 'NoUnhappfromXSpecialists' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'NoUnhappfromXSpecialistsCapital' INTEGER DEFAULT 0;

-- Flat boosts to city yield for happiness sources (buildings) - values should be positive to be good!
ALTER TABLE Buildings ADD COLUMN 'PovertyHappinessChange' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'DefenseHappinessChange' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'IlliteracyHappinessChange' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'UnculturedHappinessChange' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'MinorityHappinessChange' INTEGER DEFAULT 0;

-- Flat global boosts to city yield for happiness sources (buildings) - values should be positive to be good!
ALTER TABLE Buildings ADD COLUMN 'PovertyHappinessChangeGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'DefenseHappinessChangeGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'IlliteracyHappinessChangeGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'UnculturedHappinessChangeGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'MinorityHappinessChangeGlobal' INTEGER DEFAULT 0;

-- % reduction to city threshold for happiness sources (policies) - Values should be negative to be good!
ALTER TABLE Policies ADD COLUMN 'PovertyHappinessMod' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'DefenseHappinessMod' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'IlliteracyHappinessMod' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'UnculturedHappinessMod' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'MinorityHappinessMod' INTEGER DEFAULT 0;

-- % reduction to city threshold for happiness sources in Capital (policies) - Values should be negative to be good!
ALTER TABLE Policies ADD COLUMN 'PovertyHappinessModCapital' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'DefenseHappinessModCapital' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'IlliteracyHappinessModCapital' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'UnculturedHappinessModCapital' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'MinorityHappinessModCapital' INTEGER DEFAULT 0;

-- Reduce the Unhappiness Threshold for Puppeted Cities. Value should be negative to be good.

ALTER TABLE Policies ADD COLUMN 'PuppetUnhappinessModPolicy' INTEGER DEFAULT 0;

-- Puppets and/or Occupied cities receive a % production modifier. Values should be positive to be good.
ALTER TABLE Policies ADD COLUMN 'PuppetProdMod' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD COLUMN 'OccupiedProdMod' INTEGER DEFAULT 0;

-- Global Happiness Based on # of Citizens in Empire

ALTER TABLE Policies ADD COLUMN 'HappinessPerXPopulationGlobal' INTEGER DEFAULT 0;

-- War Weariness Mod - Positive values make it harder to accumulate war weariness.
ALTER TABLE Policies ADD COLUMN 'WarWearinessModifier' INTEGER DEFAULT 0;

-- % boosts to city yield for happiness sources (traits) - Values should be positive to be good!
ALTER TABLE Traits ADD COLUMN 'PovertyHappinessTraitMod' INTEGER DEFAULT 0;
ALTER TABLE Traits ADD COLUMN 'DefenseHappinessTraitMod' INTEGER DEFAULT 0;
ALTER TABLE Traits ADD COLUMN 'IlliteracyHappinessTraitMod' INTEGER DEFAULT 0;
ALTER TABLE Traits ADD COLUMN 'UnculturedHappinessTraitMod' INTEGER DEFAULT 0;
ALTER TABLE Traits ADD COLUMN 'MinorityHappinessTraitMod' INTEGER DEFAULT 0;

-- New Traits - Free Great Work(s) on Conquest (or Culture Boost if no great works/slots)

ALTER TABLE Traits ADD COLUMN 'FreeGreatWorkOnConquest' BOOLEAN DEFAULT FALSE;

-- New Traits - Religious Pressure modified based on population

ALTER TABLE Traits ADD COLUMN 'PopulationBoostReligion' BOOLEAN DEFAULT FALSE;

-- New Traits - Additioanl WC vote for every x CS Alliances
ALTER TABLE Traits ADD COLUMN 'VotePerXCSAlliance' INTEGER DEFAULT 0;

-- New Traits - Golden Age received from favorable peace treaty
ALTER TABLE Traits ADD COLUMN 'GoldenAgeFromVictory' INTEGER DEFAULT 0;

-- New Traits - Can buy owned plots with gold
ALTER TABLE Traits ADD COLUMN 'BuyOwnedTiles' BOOLEAN DEFAULT FALSE;

-- New Policies

-- Reduces unhappiness in occupied cities w/ Garrison. Negative = reduction.
ALTER TABLE Policies ADD COLUMN 'GarrisonsOccupiedUnhapppinessMod' INTEGER DEFAULT 0;

-- Spawns a free ranged unit with a new city.
ALTER TABLE Policies ADD COLUMN 'BestRangedUnitSpawnSettle' INTEGER DEFAULT 0;

-- No Unhappiness from Expansion
ALTER TABLE Policies ADD COLUMN 'NoUnhappinessExpansion' BOOLEAN DEFAULT FALSE;

-- No Unhapppiness from Isolation
ALTER TABLE Policies ADD COLUMN 'NoUnhappyIsolation' BOOLEAN DEFAULT FALSE;

-- Double City Border Growth During GA
ALTER TABLE Policies ADD COLUMN 'DoubleBorderGA' BOOLEAN DEFAULT FALSE;

-- Free Population
ALTER TABLE Policies ADD COLUMN 'FreePopulation' INTEGER DEFAULT 0;

-- Extra Votes
ALTER TABLE Policies ADD COLUMN 'ExtraMoves' INTEGER DEFAULT 0;

-- Religious Pressure Mod Trade Route
ALTER TABLE Policies ADD COLUMN 'TradeReligionModifier' INTEGER DEFAULT 0;

-- Increased Quest Influence
ALTER TABLE Policies ADD COLUMN 'IncreasedQuestInfluence' BOOLEAN DEFAULT FALSE;

-- Free Votes in WC
ALTER TABLE Policies ADD COLUMN 'FreeWCVotes' INTEGER DEFAULT 0;

-- GP Expend Influence Boost
ALTER TABLE Policies ADD COLUMN 'InfluenceGPExpend' INTEGER DEFAULT 0;

-- Free Trade Route
ALTER TABLE Policies ADD COLUMN 'FreeTradeRoute' INTEGER DEFAULT 0;

-- Free Spy
ALTER TABLE Policies ADD COLUMN 'FreeSpy' INTEGER DEFAULT 0;

-- Gold from Internal Trade Routes
ALTER TABLE Policies ADD COLUMN 'InternalTradeGold' INTEGER DEFAULT 0;

-- Boost Culture Bomb from Citadel
ALTER TABLE Policies ADD COLUMN 'CitadelBoost' INTEGER DEFAULT 0;

-- Unlock Era for Policy (Unlocks later eras earlier than normal)
ALTER TABLE Policies ADD COLUMN 'UnlocksPolicyBranchEra' TEXT DEFAULT NULL;

-- Points towards ideologies
ALTER TABLE Policies ADD COLUMN 'IdeologyPoint' INTEGER DEFAULT 0;

-- New Beliefs

-- Combat bonus v. other religions in our lands
ALTER TABLE Beliefs ADD COLUMN 'CombatVersusOtherReligionOwnLands' INTEGER DEFAULT 0;

-- Combat bonus v. other religions in their lands
ALTER TABLE Beliefs ADD COLUMN 'CombatVersusOtherReligionTheirLands' INTEGER DEFAULT 0;

-- Influence with CS from missionary spread
ALTER TABLE Beliefs ADD COLUMN 'MissionaryInfluenceCS' INTEGER DEFAULT 0;

-- Happiness per known civ with a Pantheon
ALTER TABLE Beliefs ADD COLUMN 'HappinessPerPantheon' INTEGER DEFAULT 0;

-- Extra Votes from Belief
ALTER TABLE Beliefs ADD COLUMN 'ExtraVotes' INTEGER DEFAULT 0;

-- New Buildings

-- National Religious Followers Needed for a Building
ALTER TABLE Buildings ADD COLUMN 'NationalFollowerPopRequired' INTEGER DEFAULT 0;

-- Global Religious Followers Needed for a Building
ALTER TABLE Buildings ADD COLUMN 'GlobalFollowerPopRequired' INTEGER DEFAULT 0;

-- Allows for Reformation Policy
ALTER TABLE Buildings ADD COLUMN 'IsReformation' BOOLEAN DEFAULT FALSE;

-- Allows for Building to be unlocked by a specific policy (not a branch)
ALTER TABLE Buildings ADD COLUMN 'PolicyType' TEXT DEFAULT NULL;

-- Allows for Building to be unlocked by a specific resource being owned (can be strategic or luxury)
ALTER TABLE Buildings ADD COLUMN 'ResourceType' TEXT DEFAULT NULL;

-- Allows for Unit to be unlocked by a specific resource being owned (can be strategic or luxury)
ALTER TABLE Units ADD COLUMN 'ResourceType' TEXT DEFAULT NULL;

-- Allows for Building to be purchased in puppet city
ALTER TABLE Buildings ADD COLUMN 'PuppetPurchaseOverride' BOOLEAN DEFAULT FALSE;

-- Allows for All Units/Buildings to be purchased in puppet city
ALTER TABLE Buildings ADD COLUMN 'AllowsPuppetPurchase' BOOLEAN DEFAULT FALSE;

-- Creates a resource unique to this civ (i.e. Indonesian Candi) in the territory around the city. To make this work with a civ, you'll need to create a new resource modelled on the Indonesian resources and assign them to the civ. Value is indicative of the number of resources that will be granted.
ALTER TABLE Buildings ADD COLUMN 'GrantsRandomResourceTerritory' INTEGER DEFAULT 0;

-- Allows you to define a building needed by this building (similar to BuildingClassNeeded) -->
ALTER TABLE Buildings ADD COLUMN 'NeedBuildingThisCity' TEXT DEFAULT NULL;

-- Allows for Unit to be purchased in puppet city
ALTER TABLE Units ADD COLUMN 'PuppetPurchaseOverride' BOOLEAN DEFAULT FALSE;

-- Grants resource to improvement
ALTER TABLE Improvements ADD COLUMN 'ImprovementResource' TEXT DEFAULT NULL;

-- Grants obsoletion tech to build (tie to improvement below for function)
ALTER TABLE Builds ADD COLUMN 'ObsoleteTech' TEXT DEFAULT NULL;

-- Grants obsoletion tech to improvement (tie to build above for AI)
ALTER TABLE Improvements ADD COLUMN 'ObsoleteTech' TEXT DEFAULT NULL;

-- Improvements can be made valid by being adjacent to a lake
ALTER TABLE Improvements ADD COLUMN 'Lakeside' BOOLEAN DEFAULT FALSE;

-- New Goody Hut Additions
ALTER TABLE GoodyHuts ADD COLUMN 'Production' INTEGER DEFAULT 0;
ALTER TABLE GoodyHuts ADD COLUMN 'GoldenAge' INTEGER DEFAULT 0;

-- Tech Additions
ALTER TABLE Technologies ADD COLUMN 'CityLessEmbarkCost' BOOLEAN;
ALTER TABLE Technologies ADD COLUMN 'CityNoEmbarkCost' BOOLEAN;

-- Promotions

ALTER TABLE UnitPromotions ADD 'ReconChange' INTEGER DEFAULT 0;

ALTER TABLE UnitPromotions ADD 'GainsXPFromScouting' BOOLEAN DEFAULT FALSE;

-- Promotion restricted to tile. Lost if unit leaves it. Only used in conjuction with free promotions from features and terrains (see above)

ALTER TABLE UnitPromotions ADD COLUMN 'IsLostOnMove' BOOLEAN DEFAULT FALSE;

-- Put the name of the Promotion in this row in order to negate it with another promotion - currently only works with the terrain/feature related promotion functions above!
ALTER TABLE UnitPromotions ADD 'NegatesPromotion' TEXT DEFAULT NULL;

-- Forced sets the damage the unit will receive from the combat REGARDLESS of how much damage was calculated to be dealt to it.
ALTER TABLE UnitPromotions ADD 'ForcedDamageValue' INTEGER DEFAULT 0;

-- Change reduces damage the unit will receive BASED on how much damage was calculated to be dealt to it. Negative numbers to reduce!
ALTER TABLE UnitPromotions ADD 'ChangeDamageValue' INTEGER DEFAULT 0;

-- A unit cannot be captured by another player (i.e. from prize ships, etc.). Does not apply to civilians.
ALTER TABLE UnitPromotions ADD 'CannotBeCaptured' BOOLEAN DEFAULT FALSE;

-- Promotion bonuses restricted to Barbarians.

ALTER TABLE UnitPromotions ADD COLUMN 'BarbarianOnly' BOOLEAN DEFAULT FALSE;

-- Promotion bonuses restricted to City States.

ALTER TABLE UnitPromotions ADD COLUMN 'CityStateOnly' BOOLEAN DEFAULT FALSE;

-- Unit stuff for minor civs
ALTER TABLE Units ADD COLUMN 'MinorCivGift' BOOLEAN DEFAULT FALSE;

-- Resource Changes for Monopolies
ALTER TABLE Resources ADD COLUMN 'MonopolyHappiness' INTEGER DEFAULT 0;
ALTER TABLE Resources ADD COLUMN 'MonopolyGALength' INTEGER DEFAULT 0;
ALTER TABLE Resources ADD COLUMN 'IsMonopoly' BOOLEAN DEFAULT FALSE;

-- Cooldowns for Units/Buildings
ALTER TABLE Units ADD COLUMN 'PurchaseCooldown' INTEGER DEFAULT 0;

ALTER TABLE Buildings ADD COLUMN 'PurchaseCooldown' INTEGER DEFAULT 0;

-- Adds Mounted trait to a unit that isn't in the unitcombat_mounted combat class
ALTER TABLE Units ADD COLUMN 'IsMounted' BOOLEAN DEFAULT FALSE;

-- Investment reduction costs -- policy -- negative makes it stronger!
ALTER TABLE Policies ADD COLUMN 'InvestmentModifier' INTEGER DEFAULT 0;

-- Investment reduction costs -- trait -- negative makes it stronger!
ALTER TABLE Traits ADD COLUMN 'InvestmentModifier' INTEGER DEFAULT 0;
