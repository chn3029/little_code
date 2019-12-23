# Copyright (c) 2019 Candela (Beijing) technology.Co.Ltd. All rights reserved.

# nodoc
module Candela3D
  # 导出类
  class Exporter
    # 初始化
    # @param [Hillside] hillside 山体
    # @param [Array<ElectricityUnit>] unit_list 发电单元列表
    # @param [Hash] cable_param 电缆参数。
    #   @option cable_param [String] :model 电缆型号及截面
    #   @option cable_param [String] :spare_core 备用芯数
    #   @option cable_param [String] :voltage 电压
    def initialize(hillside, unit_list, cable_param)
      @hillside = hillside # 山体组件
      @unit_list = unit_list # 发电单元列表
      @cable_param = cable_param # 电缆参数
    end

    # 导出一级汇流电缆清册
    # @param [String] dir_path 保存文件的目录路径
    def export_level1_cable(dir_path)
      @unit_list.each { |unit|
        # File.join(dir_path, "#{unit.name}.csv") # 保存的文件名称
        # unit.name # 发电单元名称，下同
        unit.each_level1_area { |level1_area|
          # level1_area.device.position # 设备位置
          # level1_area.device.name # 设备名称（电缆终点）
          level1_area.each_array { |array|
            # array.name # 方阵名称
            array.each_string { |string|
              # string.name # 组串名称
              # "#{string.name}a" # 电缆编号
              # "#{string.name}组串正极" # 电缆起点
              # string.positive_position # 组串正极位置
              # string.negative_position # 组串负极位置
            }
          }
        }
        unit.each_level2_area { |level2_area|
          level2_area.each_level1_area { |level1_area|
            level1_area.each_array { |array|
              # todo
            }
          }
        }
      }
    end

    # 导出二级汇流电缆清册
    def export_level2_cable(file_path)
      @unit_list.each { |unit|
        unit.each_level2_area { |level2_area|
          # level2_area.device.position
          level2_area.each_level1_area { |level1_area|
            # level1_area.device.position
            #
          }
        }
      }
    end

    # 导出三级汇流电缆清册
    def export_level3_cable(file_path)
      # todo
    end

    private

    # 计算电缆长度
    def cal_cable_length(start_pos, end_pos)
      # todo
    end
  end
end
