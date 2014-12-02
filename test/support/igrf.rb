require "igrf/workbook"

module Support
  class IGRF
    def self.file
      @@file ||= File.join("test", "igrf", "samples", "one.xlsx")
    end

    def self.game
      @@game ||= workbook.to_game
    end

    def self.workbook
      @@workbook ||= ::IGRF::Workbook.new(file)
    end
  end
end
