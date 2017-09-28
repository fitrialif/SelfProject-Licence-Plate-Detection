function corners = detect_corners(BWInput, updatedStruct, location)
    corners = detectHarrisFeatures(BWInput, 'MinQuality', 0.3, ...
        'ROI', [updatedStruct.BoundingBox]);
    corners = corners.selectStrongest(20);
    for i = 1: size(location, 1)
        for j = 1: size(corners, 1)
            corners.Location(j, i) = corners.Location(j, i) + location(i, 1);
        end
    end
    plot(corners);
end