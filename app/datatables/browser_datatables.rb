require 'json'
class BrowserDatatables
  def initialize(relation)
    @relation = relation
  end

  def as_json(options={})
    JSON.parse <<-JSON
      {
        "sEcho": 5,
        "iTotalRecords": "57",
        "iTotalDisplayRecords": "57",
        "aaData": [
          [
            "Other browsers",
            "All others",
            "-",
            "-",
            "U"
          ],
          [
            "Trident",
            "AOL browser (AOL desktop)",
            "Win XP",
            "6",
            "A"
          ],
          [
            "Gecko",
            "Camino 1.0",
            "OSX.2+",
            "1.8",
            "A"
          ],
          [
            "Gecko",
            "Camino 1.5",
            "OSX.3+",
            "1.8",
            "A"
          ],
          [
            "Misc",
            "Dillo 0.8",
            "Embedded devices",
            "-",
            "X"
          ],
          [
            "Gecko",
            "Epiphany 2.20",
            "Gnome",
            "1.8",
            "A"
          ],
          [
            "Gecko",
            "Firefox 1.0",
            "Win 98+ / OSX.2+",
            "1.7",
            "A"
          ],
          [
            "Gecko",
            "Firefox 1.5",
            "Win 98+ / OSX.2+",
            "1.8",
            "A"
          ],
          [
            "Gecko",
            "Firefox 2.0",
            "Win 98+ / OSX.2+",
            "1.8",
            "A"
          ],
          [
            "Gecko",
            "Firefox 3.0",
            "Win 2k+ / OSX.3+",
            "1.9",
            "A"
          ]
        ]
      }
    JSON
  end
end
